/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/
class cpu_driver extends uvm_driver #(cpu_seq_item);
  `uvm_component_utils(cpu_driver)
  
  virtual interface cpu_if vif;
    
    function new (string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if(!uvm_config_db#(virtual cpu_if)::get(this,"","vif",vif))
        `uvm_fatal("No_vif",{"Virtual interface must be set for: ",get_full_name(),".vif"});
      `uvm_info(get_full_name(), "Build state complete.", UVM_HIGH)
    endfunction : build_phase
      
    // **** For memory-loaded directed test, will not inject stimulus, its already in memory. Simply collecting packets from monitor to monitor current address state
    
    /*
   virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      `uvm_info(get_type_name(), $sformatf("Sending Packet :\n%s", req.sprint()),UVM_MEDIUM)
      drive();
      seq_item_port.item_done();
    end
  endtask : run_phase
    
    virtual task drive();
      @(posedge vif.DRIVER.clk);

      //------------ Placeholder
      
      @(posedge vif.DRIVER.clk);
      
      //------------ Placeholder
      
      @(posedge vif.DRIVER.clk);
    endtask : drive
      */
    
    endclass : cpu_driver
    