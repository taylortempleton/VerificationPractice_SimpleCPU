/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/
class cpu_seq_item extends uvm_sequence_item;

  logic halt;
  logic load_ir;
  logic [4:0] pc_addr;

  `uvm_object_utils_begin(cpu_seq_item)
  `uvm_field_int(halt, UVM_ALL_ON) 
  `uvm_field_int(load_ir, UVM_ALL_ON)
  `uvm_field_int(pc_addr, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "seq item");
    super.new(name);
  endfunction
  
endclass : cpu_seq_item


