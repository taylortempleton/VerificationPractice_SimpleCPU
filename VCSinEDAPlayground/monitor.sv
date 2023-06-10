/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/
class cpu_monitor extends uvm_monitor;
  `uvm_component_utils(cpu_monitor)
  
  virtual interface cpu_if vif;
    uvm_analysis_port#(cpu_seq_item)item_collected_port;
    cpu_seq_item trans_collected;
    cpu_seq_item trans_collected_clone;
    int num_pkts; 
    
    function new(string name, uvm_component parent);
      super.new(name, parent);   
    endfunction : new
    
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      trans_collected = cpu_seq_item::type_id::create("trans_collected",this);
      trans_collected_clone = cpu_seq_item::type_id::create("trans_collected_clone",this);
      item_collected_port = new("item_collected_port", this);
      
      if(!uvm_config_db#(virtual cpu_if)::get(this,"","vif",vif))
        `uvm_fatal("No vif",{"virtual interace must be set for: ",get_full_name(),"vif"});
      `uvm_info(get_full_name(), "Build state complete.", UVM_HIGH)
    endfunction : build_phase
 
  virtual task run_phase(uvm_phase phase);
      forever begin
        get_inputs();
        get_outputs();
        castwriteprint_item();
      end
    endtask : run_phase
        
    virtual task get_inputs();
        @(posedge vif.MONITOR.clk);
        trans_collected.halt = vif.monitor_cb.halt;
        trans_collected.load_ir = vif.monitor_cb.load_ir; 
        trans_collected.pc_addr = vif.monitor_cb.pc_addr;
    endtask : get_inputs
    
    virtual task get_outputs();     
        @(posedge vif.MONITOR.clk); 
      /* 
      trans_collected.clk = vif.monitor_cb.clk;
        trans_collected.cntrl_clk = vif.monitor_cb.cntrl_clk;        
        trans_collected.alu_clk = vif.monitor_cb.alu_clk;
        trans_collected.fetch = vif.monitor_cb.fetch;
        trans_collected.rst_ = vif.monitor_cb.rst_;
        */
    endtask : get_outputs
    
    virtual task castwriteprint_item();
      @(posedge vif.MONITOR.clk);
      $cast(trans_collected_clone,trans_collected.clone());
      `uvm_info(get_type_name(), $sformatf("Print values in MONITOR: \n%s", trans_collected_clone.sprint()), UVM_HIGH)
      item_collected_port.write(trans_collected_clone);
      num_pkts++;
    endtask : castwriteprint_item
    
    virtual function void report_phase(uvm_phase phase);
      `uvm_info(get_type_name(),$sformatf("Total number of packets collected in Monitor = %0d", num_pkts),UVM_HIGH)
    endfunction : report_phase
    
    endclass : cpu_monitor
    
    
    