/*-----------------------------------------------------------------
taylor.templeton@gmail.com
May 2023

Verification Practice Project
Verify each block -> Verify CPU

**Verilator - No UVM**

-----------------------------------------------------------------*/

`include "cpu.sv"
`include "testbench_top.sv"
`include "interfaces.sv"


module cpu_test; 
timeunit 1ns;
timeprecision 100ps;




  
  logic rst_;
  logic [12*8:1] testfile; // temporary storage for test vector file
  opcode_t   topcode; 
  logic clk, alu_clk, cntrl_clk, fetch;
  
//--------------- Multi Clock Generator-----START
  
//*************CLOCK IMPLEMENTATION IS GOOFY AND NEEDS WORK****************
`define PERIOD 10
  
logic master_clk = 1'b1;
logic [3:0] count;

  always
    #(`PERIOD/2) master_clk = ~master_clk;

  always @(posedge master_clk or negedge rst_)
   if (~rst_)
     count <= 3'b0;
   else
     count <= count + 1;

assign cntrl_clk = ~count[0];
assign clk  = count[1];
assign fetch = ~count[3];
assign alu_clk = ~(count == 4'hc);
  
//--------------- Multi Clock Generator-----END
  
//--------------- Initial Reset Generator-----START
  initial begin
    rst_ = 1;
    repeat (2) @(negedge master_clk);
    rst_ = 0;
    repeat (2) @(negedge master_clk);
    rst_ = 1;
  end
//--------------- Initial Reset Generator-----END
  
cpu_if intf(
  clk,
  cntrl_clk,
  fetch,
  alu_clk,
  rst_
  );

cpu cpu1 (
  .pc_addr_if(intf.pc_addr), 
  .halt (intf.halt),
  .load_ir(intf.load_ir),
  .clk (intf.clk),     
  .alu_clk (intf.alu_clk),    
  .cntrl_clk (intf.cntrl_clk),    
  .fetch (intf.fetch),
  .rst_ (intf.rst_)
);
  
// Set interface in configdb
    initial begin
      uvm_config_db#(virtual interface cpu_if)::set(uvm_root::get(),"*","vif",intf);
    end
        
// Load test vectors into memory prior to test
  initial begin
    testfile = {"CPUtest01.dat"};
    $readmemb ( testfile, cpu1.mem1.memory );
  end
  
  initial begin
    run_test("cpu_base_test");  
  end
      // Capture waveform in value change dump
    initial begin
      $dumpfile("dump.vcd");          
      $dumpvars;
    end 
  
endmodule