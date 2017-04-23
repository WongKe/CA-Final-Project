//EECE3324
//Computer Architecture
//Final Project
//Kevin Wong & Jonathan Marrero


// Adds 4 to input

module Add4(innput0, output0);
  input [31:0] input0;
  output reg [31:0] output0;
  
  always @ (input0) begin
    output0 = input0 + 4;
  end
  
endmodule
