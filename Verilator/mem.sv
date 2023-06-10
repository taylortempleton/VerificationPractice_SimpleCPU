///////////////////////////////////////////////////////////////////////////
// (c) Copyright 2013 Cadence Design Systems, Inc. All Rights Reserved.
//
// File name   : register.sv
// Title       : Register Module
// Project     : SystemVerilog Training
// Created     : 2013-4-8
// Description : Defines the register module
// Notes       :
// 
///////////////////////////////////////////////////////////////////////////
module mem (
        input        clk,
        input        read,
        input        write,  
        input  logic [4:0] addr,
        input  logic [7:0] data_in,
        output logic [7:0] data_out
	   );
// SYSTEMVERILOG: timeunit and timeprecision specification
timeunit 1ns;
timeprecision 1ns;

// SYSTEMVERILOG: logic data type
logic [7:0] memory [0:31] ;
  
  always @(posedge clk)
    if (write && !read)
// SYSTEMVERILOG: time literals
      #1 memory[addr] <= data_in;

// SYSTEMVERILOG: always_ff and iff event control
  always_ff @(posedge clk iff ((read == '1)&&(write == '0)) )
       data_out <= memory[addr];

endmodule