// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

//Control Unit module

//Taken from HW6 Solutions

module ControlUnit(RegDst,Jump,Branch,MemRead,MemReg,MemWrite,AlUsrc,RegWrite,Aluop, opCode);
output reg RegDst,Jump,Branch,MemRead,MemWrite,AlUsrc,RegWrite, MemReg;
output reg [2:0] Aluop;
input [5:0] opCode;


always @ (opCode)
begin

case(opCode)

6'b000000://add Rtype
begin
RegDst=1;
Jump=0;
Branch=0;
MemRead=0;
MemWrite=0;
AlUsrc=0;
RegWrite=1;
Aluop[0]=0;
Aluop[1]=1;
Aluop[2]=0;
MemReg=0;
end
6'b100011://load
begin
RegDst=0;
Jump=0;
Branch=0;
MemRead=1;
MemWrite=0;
AlUsrc=1;
RegWrite=1;
Aluop[0]=0;
Aluop[1]=0;
Aluop[2]=1;
MemReg =1;
end
6'b101011://store
begin
RegDst=0;
Jump=0;
Branch=0;
MemRead=0;
MemWrite=1;
AlUsrc=1;
RegWrite=0;
Aluop[0]=0;
Aluop[1]=0;
Aluop[2]=1;
MemReg=0;
end
6'b000100://beq
begin
RegDst=0;
Jump=0;
Branch=1;
MemRead=0;
MemWrite=0;
AlUsrc=0;
RegWrite=0;
Aluop[0]=1;
Aluop[1]=1;
Aluop[2]=1;
MemReg =0;
end
6'b00010://j
begin
RegDst=0;
Jump=1;
Branch=0;
MemRead=0;
MemWrite=0;
AlUsrc=0;
RegWrite=0;
Aluop[0]=0;
Aluop[1]=0;
Aluop[2]=0;
MemReg =0;
end
6'b001000://addi
begin
RegDst=0;
Jump=0;
Branch=0;
MemRead=0;
MemWrite=0;
AlUsrc=1;
RegWrite=1;
Aluop[0]=0;
Aluop[1]=0;
Aluop[2]=1;
MemReg=0;
end

6'b001100://andi
begin
RegDst=0;
Jump=0;
Branch=0;
MemRead=0;
MemWrite=0;
AlUsrc=1;
RegWrite=1;
Aluop[0]=1;
Aluop[1]=0;
Aluop[2]=1;
MemReg=0;
end

6'b001101://ori
begin
RegDst=1;
Jump=0;
Branch=0;
MemRead=0;
MemWrite=0;
AlUsrc=0;
RegWrite=1;
Aluop[0]=0;
Aluop[1]=1;
Aluop[2]=1;
MemReg=0;
end
   
endcase

end

endmodule
