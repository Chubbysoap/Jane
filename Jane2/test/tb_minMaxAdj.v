`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2025 09:23:15 AM
// Design Name: 
// Module Name: tb_minMaxAdj
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


module tb_minMaxAdj();
  //1-bit ins
  reg en, minMaxSel;
  //2+bit ins
  reg [31:0] in; 
  reg [3:0] len;
  //out
  wire [31:0] adjVal;
  wire [3:0] adjLen;


  minMaxAdj DUT(.en(en), .in(in), .minMaxSel(minMaxSel), .len(len), .adjVal(adjVal), .adjLen(adjLen));
  
  initial begin
    en = 1; in = 32'd0;  minMaxSel = 0;
    
    //min 3 len, should out to 32'd1000
    #10 en = 1;  in = 32'd100; len = 4'd3;
    //max 3 len, out to 32'd10
    #10 en = 1; minMaxSel = 1; in = 32'd100; len = 4'd3;
    // test for even leng
    #10 en = 1; minMaxSel = 1; in = 32'd1000; len = 4'd4;

    // test a few through cases
    #10 en = 1; minMaxSel = 1; in = 32'd1234; len = 4'd4;
    #10 en = 1; minMaxSel = 0; in = 32'd4321; len = 4'd4;
    #10 en = 1; minMaxSel = 1; in = 32'd1234567890; len = 4'd10;

  end
endmodule
