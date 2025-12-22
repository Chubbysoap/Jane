`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 10:07:59 AM
// Design Name: 
// Module Name: top
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


module top();

  reg en, rst;

  reg [39:0] min, max; // into lengFind and minMaxAdj

  wire [3:0] minLen, maxLen; // from lenFind to minMaxAdj

  reg minSel = 1'b0;
  reg maxSel = 1'b1; // into minMaxAdj

  wire [39:0] adjMin, adjMax; //from minMaxAdj to invFinder 

  wire [3:0] adjMinLen, adjMaxLen; //from minMaxAdj to invFinder. Only one will actually be necessary since all test cases will adjust to same length

  wire [39:0] invCnt; // from invFinder to invCntr

  // min and max length finders
  lengFind minLenFind (.en(en), .rst(rst), .in(min), .len(minLen));
  lengFind maxLenFind (.en(en), .rst(rst), .in(max), .len(maxLen));

  // mib and max adjustments
  minMaxAdj minAdj(.en(en), .in(min), .minMaxSel(minSel), .len(minLen), .adjVal(adjMin), .adjLen(adjMinLen));
  minMaxAdj maxAdj(.en(en), .in(max), .minMaxSel(maxSel), .len(maxLen), .adjVal(adjMax), .adjLen(adjMaxLen));

  //invCntr
  invalidCntr invCntr(.en(en), .adjLen(adjMinLen), .min(adjMin), .max(adjMax), .invCnt(invCnt));

  
  
initial begin
  //en = 0; rst = 1; min = 34'd9191906840; max = 34'd9191941337;
  en = 0; rst = 1; min = 40'd38593856; max = 40'd38593862;
  #5 rst = 0; en = 1;  // release reset
  
  
 

end
endmodule
