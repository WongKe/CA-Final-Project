//EECE3324
//Computer Architecture
//Final Project
//Kevin Wong & Jonathan Marrero


// Adds 4 to input

module Add4(in, out);
  input [31:0] in;
  output reg [31:0] out;
  
  always @ (in) begin
    out = in + 4;
  end
  
endmodule
