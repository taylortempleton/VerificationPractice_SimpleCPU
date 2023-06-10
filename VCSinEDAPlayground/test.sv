/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/

class cpu_base_test extends uvm_test;
  `uvm_component_utils(cpu_base_test)
  
  cpu_base_env environ;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    environ = cpu_base_env::type_id::create("environ",this);
    `uvm_info(get_full_name(), "Build state complete.", UVM_HIGH) 
  endfunction : build_phase
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.set_report_verbosity_level_hier(UVM_MEDIUM);
    this.print();
  endfunction : end_of_elaboration_phase
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this); 
    `uvm_info(get_type_name(), "Objection raised",UVM_HIGH)
    #1000ns;
    phase.drop_objection(this); 
    `uvm_info(get_type_name(), "Objection dropped",UVM_HIGH)
  endtask : run_phase
  
endclass : cpu_base_test
