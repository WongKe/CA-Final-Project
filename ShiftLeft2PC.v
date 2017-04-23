// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Shift Left 2 module (PC Loop)
//
// Calculates jump target address:  
//   shift lower 26 bits of jump instruction left 2 bits
//   concatenate upper 4 bits of PC+4 as high-order bits

`timescale 1ns/1ns

module ShiftLeft2PC(instruction, PC4, out);
  
  input [25:0] instruction;       // instruction [25-0]
  input [31:0] PC4;         // PC+4 bits 
  output reg [31:0] out;   // output [31-0]
  
  always @ (instruction) begin
    // add two zeros to end to shift left 2 bits,
    // then add the upper 4 bits of PC+4
    out = {PC4[31:28], {instruction[25:0], 2'b00}}; 
  end
endmodule 
