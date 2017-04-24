// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

//ALU Control module

//Taken from HW6 Solutions

module ALUControlUnit(ALUOPcode, ALUOP,FunctCode);
input [2:0] ALUOP;
input [5:0] FunctCode;
output reg [3:0] ALUOPcode;

always @(ALUOP or FunctCode)
begin

if(ALUOP==3'b100) ALUOPcode <= 4'b0010;    //lw,store,addi
else if(ALUOP==3'b111) ALUOPcode <= 4'b0110;  //beq
else if(ALUOP==3'b101) ALUOPcode <= 4'b0000;  //andi
else if(ALUOP==3'b110) ALUOPcode <= 4'b0001;  //ori
else if(ALUOP==3'b010&& FunctCode==6'b100000) ALUOPcode <= 4'b0010;//add
else if(ALUOP==3'b010&& FunctCode==6'b100010) ALUOPcode <= 4'b0110;//sub
else if(ALUOP==3'b010&& FunctCode==6'b100100) ALUOPcode <= 4'b0000;//and
else if(ALUOP==3'b010&& FunctCode==6'b101010) ALUOPcode <= 4'b0111;//slt
else if(ALUOP==3'b010&& FunctCode==6'b100101) ALUOPcode <= 4'b0111;//or
end
endmodule 
