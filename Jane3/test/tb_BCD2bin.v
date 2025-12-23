`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2025 08:40:25 AM
// Design Name: 
// Module Name: tb_BCD2bin
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


module tb_BCD2bin();

reg [7:0] bcdIn;

wire [6:0] binOut;

BCD2bin DUT (.bcdIn(bcdIn), .binOut(binOut));

initial begin

  bcdIn = 8'b10000111;
  #5;

end

endmodule
