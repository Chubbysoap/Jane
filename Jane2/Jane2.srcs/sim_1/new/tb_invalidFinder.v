`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 08:37:30 AM
// Design Name: 
// Module Name: tb_invalidFinder
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


module tb_invalidFinder();
  //1-bit ins
  reg en;
  //2+bit ins
  reg [3:0] adjLen;
  reg [39:0] min, max;
// outs
  wire [7:0] invCnt;
  wire [33:0] testPoint;

  invalidFinder DUT(.en(en), .adjLen(adjLen), .min(min), .max(max), .invCnt(invCnt), .testPoint(testPoint));

  initial begin
    //length of 2
    en=1'b1; adjLen = 4'd2; min = 32'd10; max = 32'd11; //invCnt = 1
    
    #10; adjLen = 4'd2; min = 32'd12; max = 32'd13;  //invCnt = 0
    //length of 3
    #10; adjLen = 4'd4; min = 32'd1000; max = 32'd1200;  //invCnt = 2 i think
    #10; adjLen = 4'd4; min = 32'd1000; max = 32'd2000;  //invCnt = 10 i think

    
  end
endmodule



