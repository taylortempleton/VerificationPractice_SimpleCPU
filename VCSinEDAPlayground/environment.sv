/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/

class cpu_base_env extends uvm_env;
  `uvm_component_utils(cpu_base_env)
  
  cpu_base_agent agnt;
  cpu_scoreboard scb;
  //cov_class Coverage; // no coverage during debug
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agnt = cpu_base_agent::type_id::create("agnt",this);
    scb = cpu_scoreboard::type_id::create("scb",this);
    //Coverage = cov_class::type_id::create("Coverage",this); // no coverage during debug
    `uvm_info(get_full_name(), "Build state complete.", UVM_HIGH)
  endfunction : build_phase
  
  function void connect_phase(uvm_phase phase);
    agnt.mntr.item_collected_port.connect(scb.item_collected_export);
    //agnt.mntr.idem_collected_port.connect(Coverage.analysis_export); // no coverage during debug
    `uvm_info(get_full_name(), "Connect phase complete.", UVM_HIGH)
  endfunction : connect_phase
  
  function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), {"start of simulation for ", get_full_name()}, UVM_HIGH)
  endfunction : start_of_simulation_phase
  
endclass : cpu_base_env
