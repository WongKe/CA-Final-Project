//EECE3324
//Computer Architecture
//Final Project
//Kevin Wong & Jonathan Marrero


// Adder 32-bits

module Adder(input0, input1, output0);
  input [31:0] input0, input1;
  output reg [31:0] output0;
  
  always @ (input0 or input1) begin
    output0 = input0 + input1;
  end
endmodule
