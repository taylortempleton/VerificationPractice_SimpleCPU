/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/

class cpu_sequencer extends uvm_sequencer#(cpu_seq_item);
  `uvm_component_utils(cpu_sequencer)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
endclass : cpu_sequencer

