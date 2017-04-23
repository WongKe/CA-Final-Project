// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for Register File
// Taken from HW6 Solutions


module reg_32b(write_data,enable,reset,clk,read_data);
  input enable,reset,clk;
  input [31:0] write_data;
  output [31:0] read_data;
  reg [31:0] read_data;
  always @ (posedge reset or posedge clk) 
 begin
    if (reset==1)
      read_data=32'h00000000;
    else if (enable==1) 
      read_data=write_data;
    else 
       read_data=32'hxxxxxxxx;

  end
endmodule