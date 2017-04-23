// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for Register File
// Taken from HW6 Solutions

module registerfile(readAddr1,readAddr2,writeAddr,writeData,writeEnable,clk,readData1,readData2,reset);
  input [4:0] readAddr1, readAddr2,writeAddr;
  input [31:0] writeData;
  input writeEnable, clk,reset;
  output [31:0] readData1,readData2;
  reg [31:0] regFile [0:31]; 
  
  always @(posedge clk)
  begin
  if (writeEnable)
    regFile[writeAddr] <= writeData; 
  else
    regFile[writeAddr] <= 32'hxxxxxxxx; 
  end

assign readData1 = regFile[readAddr1]; 
assign readData2 = regFile[readAddr2]; 

endmodule

 
