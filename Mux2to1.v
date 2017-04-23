//EECE3324
//Computer Architecture
//Final Project
//Kevin Wong & Jonathan Marrero-Rosaly

// Module for 2-to-1 MUX  32-bit inputs

`timescale 1ns / 1ns

module Mux2to1(input0, input1, select, out);
  
  input [31:0] input0, input1;   // input 1 & 2
  input select;              	 // bit for select
  output reg [31:0] out;         // output
  

  //MUX Loop

  always @ (select or input0 or input1)
  begin
    case(select)
      // if select = 0
      1'b0: begin
        // select 1st input
        out <= input0;
      end
      // if select = 1
      1'b1: begin
        // select 2nd input
        out <= input1;
      end
    endcase
  end
endmodule