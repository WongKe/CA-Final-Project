// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero


// Module for Program Counter file

module PCmodule(input1, clk, resetPC, out1);
  
  input [31:0] input1;
  input clk, resetPC;
  output reg [31:0] out1;
  
  //Reset case and handling output

  always @ (posedge clk or posedge resetPC) begin
    if (resetPC)
      out1 <= 4096;
    else
      out1 <= input1;
  end
  
endmodule
