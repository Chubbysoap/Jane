`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2025 03:58:45 PM
// Design Name: 
// Module Name: zCntr
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


module zCntr(
  input clk,
  input rst,
  input [6:0] adj_val,
  output reg [3:0] zCnt
    );
    
    always @(posedge clk) begin
      if (rst) begin
      zCnt <= 4'b0;
      end
      else if (adj_val == 7'b0)
        zCnt <= zCnt + 1'd1;
    end
endmodule
