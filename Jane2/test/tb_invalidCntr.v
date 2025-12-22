`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2025 05:48:34 PM
// Design Name: 
// Module Name: tb_invalidCntr
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


module tb_invalidCntr();

//1-bit ins
  reg en;
  //2+bit ins
  reg [3:0] adjLen;
  reg [39:0] min, max;
// outs
  wire [39:0] invCnt;
  wire [39:0] testPoint;

  invalidCntr DUT(.en(en), .adjLen(adjLen), .min(min), .max(max), .invCnt(invCnt), .testPoint(testPoint));

  initial begin
    //length of 2
    en=1'b1;  adjLen = 4'd2; min = 32'd10; max = 32'd11; //invCnt = 11
    
    #10; adjLen = 4'd2; min = 32'd10; max = 32'd99;  //invCnt = 495
    //length of 3
  //  #10; adjLen = 4'd4; min = 32'd1000; max = 32'd1200;  //invCnt =  i think
    //#10; adjLen = 4'd4; min = 32'd1000; max = 32'd2000;  //invCnt = 10 i think

    
  end
endmodule


