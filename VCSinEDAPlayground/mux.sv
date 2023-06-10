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
module scale_mux #(WIDTH = 1)
                  (output logic [WIDTH-1:0] out,
                   input  logic [WIDTH-1:0] in_a,
                   input  logic [WIDTH-1:0] in_b,
                   input  logic sel_a);

timeunit 1ns;
timeprecision 100ps;

always_comb
  unique case (sel_a)
    1'b1: out = in_a;
    1'b0: out = in_b;
    default: out = 'x;
  endcase

endmodule