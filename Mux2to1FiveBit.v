// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

//Module for Mux2to1 5 bit

`timescale 1ns / 1ns

module Mux2to1FiveBit(input0, input1, select, out);
  
  input [4:0] input0, input1;	// input 1 & 2
  input select;            	// bit for select
  output reg [4:0] out; 	// ouput
  

  // MUX Loop

  always @ (select or input0 or input1)
  begin
    case(select)
      // if select = 0
      1'b0: begin
        // Select 1st input
        out <= input0;
      end
      // if select = 1
      1'b1: begin
        // Select 2nd input
        out <= input1;
      end
    endcase
  end
endmodule
