`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2025 04:05:50 PM
// Design Name: 
// Module Name: tb_zCnt
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


module tb_zCnt();
  //1-bit ins
  reg clk; reg rst;
  //2+bit ins
  reg [6:0] adj_val;
  //outs
  wire [3:0] zCnt;

  zCntr DUT(.clk(clk), .rst(rst), .adj_val(adj_val), .zCnt(zCnt));

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;
    adj_val = 50;
    
    #20 rst = 1;
    #20 rst = 0;
    
    #10 adj_val = 0;
    #10 adj_val = 5;
    #10 adj_val = 0;
    #10 adj_val = 6;
    #10 adj_val = 0;
    #10 adj_val = 10;
    #10 adj_val = 10;
    #10 adj_val = 0;
    #10 adj_val = 0;
    #10 $finish;  
  end
endmodule
