// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

//Control Unit module

//Taken from HW6 Solutions

`timescale 1ns / 1ns

module ControlUnit(opcode, rst, RegDst, Jump, Branch, 
                    MemRead, MemtoReg, MemWrite, ALUsrc, 
                    RegWrite, ALUOp, addi, HLT);
  
  input [5:0] opcode;
  input rst;
  output reg RegDst, Jump, Branch, MemRead, MemtoReg, 
              MemWrite, ALUsrc, RegWrite, addi, HLT;
  output reg [1:0] ALUOp;
  
  // initialize
  initial begin
    RegDst = 0;
    ALUsrc = 0;
    MemtoReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    ALUOp = 2'b00;
    Jump = 0;
    addi	= 0;
    HLT = 0;
  end
        
  // get outputs
  always @ (opcode) begin
    
	  // generate control signals
	  case (opcode)
	    // R-format
	    6'b000000: begin
	      RegDst = 1;
	      ALUsrc = 0;
	      MemtoReg = 0;
	      RegWrite = 1;
	      MemRead = 0;
	      MemWrite = 0;
	      Branch = 0;
	      ALUOp = 2'b10;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
      end
      
      // addi
      6'b001000: begin
        RegDst = 0;
	      ALUsrc = 1;
	      MemtoReg = 0;
	      RegWrite = 1;
	      MemRead = 0;
	      MemWrite = 0;
	      Branch = 0;
	      ALUOp = 2'b10;
	      Jump = 0;
	      addi = 1;
	      HLT = 0;
      end
        
      // lw
      6'b100011: begin
        RegDst = 0;
        ALUsrc = 1;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
	      ALUOp = 2'b00;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
      end
        
      // sw
      6'b101011: begin
        //RegDst = x;   (don't care)
        ALUsrc = 1;
        //MemtoReg = x; (don't care)
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
	      ALUOp = 2'b00;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
		  end
        
      // beq
      6'b000100: begin
        //RegDst = x;   (don't care)
        ALUsrc = 0;
        //MemtoReg = x; (don't care)
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
	      ALUOp = 2'b01;
	      Jump = 0;
	      addi = 0;
	      HLT = 0;
      end
      
      // jump
      6'b000010: begin
        //RegDst = x;     (don't care)
        //ALUsrc = x;     (don't care)
        //MemtoReg = x;   (don't care)
        //RegWrite = x;   (don't care)
        //MemRead = x;    (don't care)
        //MemWrite = x;   (don't care)
        //Branch = x;     (don't care)
        //ALUOp = 2'bxx;  (don't care)
        Jump = 1;
        //addi	= x;       (don't care)
        //HLT = x;        (don't care)
      end
      
      // Halt
      6'b111111: begin
        //RegDst = x;     (don't care)
        //ALUsrc = x;     (don't care)
        //MemtoReg = x;   (don't care)
        //RegWrite = x;   (don't care)
        //MemRead = x;    (don't care)
        //MemWrite = x;   (don't care)
        //Branch = x;     (don't care)
        //ALUOp = 2'bxx;  (don't care)
        //Jump = x;       (don't care)
        //addi	= x;       (don't care)
        HLT = 1;
      end     
      
      default: begin
        RegDst = 0;
        ALUsrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b00;
        Jump = 0;
        addi	= 0;
        HLT = 0;
      end
    endcase
  end
  
endmodule
