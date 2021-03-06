//EECE3324
//Computer Architecture
//Final Project
//Kevin Wong & Jonathan Marrero-Rosaly

//Module for Sign Extend

module SignExtend(instruction, SignExtend_out);
  
  input [15:0] instruction;  // Instruction [15-0]
  output reg [31:0] SignExtend_out; // Output Sign Extend [31-0]
  
  // Perform Extend

  always @ (instruction) begin
    SignExtend_out <= $signed(instruction);
  end
endmodule