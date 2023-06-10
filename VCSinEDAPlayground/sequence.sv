/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/
class cpu_base_sequence extends uvm_sequence#(cpu_seq_item);
  `uvm_object_utils(cpu_base_sequence)
  
  function new(string name = "cpu_base_sequencer");
    super.new(name);
  endfunction
  
    // **** For memory-loaded directed test, not injecting stimulus
  /*
  virtual task body();
    repeat(0) begin
      req=seq_item::type_id::create("req");
      start_item(req);
      if(!req.randomize()) begin
        `uvm_error("Sequence body", "Randomize Failure!")
      end
      finish_item(req);
    end
  endtask
*/
endclass : cpu_base_sequence
             