// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// ALU that supports the following MIPS instructions: add, addi, beq, j, lw and sw  
// takes a 4-bit control signal and two 32-bit data inputs 
// generates two outputs (32-bit ALUresult and 1-bit Zero).   

`timescale 1ns / 1ns

module ALU(ALUop, in0, in1, ALUresult, Zero);
  
  input [3:0] ALUop;
  input [31:0] in0, in1;
  output reg [31:0] ALUresult;
  output Zero;
  
  // set zero 
  assign Zero = (ALUresult == '0);
  
  // generate ALU result
  always @ (in0 or in1 or ALUop) begin
    
    case (ALUop)
      // and
      4'b0000: begin ALUresult = in0 & in1; end
      // or
      4'b0001: begin ALUresult = in0 | in1; end
      // add
      4'b0010: begin ALUresult = in0 + in1; end
      // sub
      4'b0110: begin ALUresult = in0 - in1; end
      // slt
      4'b0111: begin ALUresult = in0 < in1 ? 1 : 0; end
      // nor
      4'b1000: begin ALUresult = ~(in0 | in1); end
      default: begin ALUresult = 0; end
    endcase
  end
  
endmodule
