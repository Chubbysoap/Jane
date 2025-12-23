`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2025 05:58:48 PM
// Design Name: 
// Module Name: tb_joltFinder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_joltFinder();

reg [19:0] bcdIn;

wire [7:0] maxJoltBCD;
wire [7:0] pos;

joltFinder DUT(.bcdIn(bcdIn), .maxJoltBCD(maxJoltBCD), .pos(pos));

initial begin
  bcdIn = 20'b00010010100110000100;
  
  #10;


end
endmodule
