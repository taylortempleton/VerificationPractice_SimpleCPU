/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/

class cpu_base_agent extends uvm_agent;
  
  cpu_monitor mntr;
  cpu_sequencer seqr;
  cpu_driver drvr;
  
  `uvm_component_utils_begin(cpu_base_agent)
  `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
  `uvm_component_utils_end
  
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    mntr = cpu_monitor::type_id::create("mntr",this);
    if(is_active == UVM_ACTIVE) begin
    seqr = cpu_sequencer::type_id::create("seqr",this);
    drvr = cpu_driver::type_id::create("drvr",this);
    end
    `uvm_info(get_full_name(), "Build state complete.", UVM_HIGH)
  endfunction : build_phase
  
  function void connect_phase (uvm_phase phase);
    if(is_active == UVM_ACTIVE)
    drvr.seq_item_port.connect(seqr.seq_item_export);
    `uvm_info(get_full_name(),"Connect state complete.", UVM_HIGH)
  endfunction : connect_phase
  
endclass : cpu_base_agent

