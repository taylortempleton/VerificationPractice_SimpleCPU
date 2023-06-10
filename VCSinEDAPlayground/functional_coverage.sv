/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/

// no functional coverage during debug

class cpu_cov_class extends uvm_subscriber#(cpu_seq_item);
  `uvm_component_utils(cpu_cov_class)
  
  cpu_seq_item cov_seq_item;
  
  covergroup cg_dummy;
    
    option.comment = "Dummy coverage";
    
    cp_dummy: coverpoint(cov_seq_item.pc_addr)
    {
      bins b_dummy = {[0:1]};
    }
  endgroup : cg_dummy
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void write(cpu_seq_item t);
    cov_seq_item = t;
    cg_dummy.sample();
  endfunction : write
  /*
  
    function void report_phase(uvm_phase phase);
    `uvm_info(get_name(),"--------------------------------------------------------------------------",UVM_LOW);    
      `uvm_info(get_name(),$sformatf("Coverage: Overall coverage is %0.2f%%", cp_dummy.get_coverage()),UVM_LOW);
      
    // Example 
      //`uvm_info(get_name(),$sformatf("Bin cg_decode.cp_accum: (Tested accum 0 and non-0?): %0.2f %%", cg_decode.cp_accum.get_coverage()),UVM_LOW);

    `uvm_info(get_name(),"--------------------------------------------------------------------------",UVM_LOW);
  endfunction
  */
  
endclass : cpu_cov_class

