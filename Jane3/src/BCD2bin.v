`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2025 08:20:50 AM
// Design Name: 
// Module Name: BCD2bin
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


module BCD2bin(
  input [7:0] bcdIn,
  
  output reg [6:0] binOut
    );

  always @(*) begin 
    // always 2 BCD ins
      binOut = bcdIn[3-:4] + bcdIn[7-:4]*10;
  
  
  end    
endmodule
