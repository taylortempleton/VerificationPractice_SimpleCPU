/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU
-----------------------------------------------------------------*/
interface cpu_if(
  input clk,
  input cntrl_clk,
  input fetch,
  input alu_clk,
  input rst_ 
);

  logic halt;
  logic load_ir;
  
  logic [4:0] pc_addr;

 

  clocking driver_cb @(posedge clk);
    input pc_addr;
    
    input halt;
    input load_ir;
    output clk;
    output alu_clk;
    output cntrl_clk;
    output fetch;
    output rst_;
  endclocking
  
  clocking monitor_cb @(posedge clk);
    input pc_addr;
    
    input halt;
    input load_ir;
    input clk;
    input alu_clk;
    input cntrl_clk;
    input fetch;
    input rst_;

    
  endclocking
  
  modport DRIVER(clocking driver_cb, input clk);
  modport MONITOR(clocking monitor_cb, input clk);
    
      `include "assertion_coverage.sv"
    
    endinterface