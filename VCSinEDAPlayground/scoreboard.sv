/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/
class cpu_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(cpu_scoreboard)
  
  uvm_analysis_imp#(cpu_seq_item, cpu_scoreboard) item_collected_export;
  cpu_seq_item data;
  cpu_seq_item pkt_qu[$];
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export",this);
    `uvm_info(get_full_name(), "Build state complete.", UVM_HIGH)
  endfunction : build_phase
  
  virtual function void write (cpu_seq_item trans_collected);
    `uvm_info(get_type_name(), $sformatf("Print values in SCOREBOARD: \n%s", trans_collected.sprint()), UVM_HIGH)
    pkt_qu.push_back(trans_collected);
  endfunction : write
  
  virtual task run_phase (uvm_phase phase);
    cpu_seq_item seq;
    phase.raise_objection(this);
    forever begin
      wait(pkt_qu.size()>0);
      seq=pkt_qu.pop_front();
      `uvm_info(get_type_name(), $sformatf("Print address in SCOREBOARD: %h",seq.pc_addr), UVM_MEDIUM)
      if (seq.pc_addr == 17) begin
        `uvm_info(get_type_name(),$sformatf("CPU test 01 passes! CPU Address (hx%h) == Passing Test Address (hx11)",seq.pc_addr),UVM_MEDIUM)
        phase.drop_objection(this);
      end     
    end  
    
  endtask : run_phase
  
endclass : cpu_scoreboard
