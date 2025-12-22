`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2025 09:48:25 AM
// Design Name: 
// Module Name: CombLoc
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


module CombLoc();
always #5 clk = ~clk;


// ------AddSub------
reg clk, dir, en, rst;
//2+-bit inputs
reg [9:0] mag;

//output
wire [6:0] val;
wire [11:0] intWatch;


AddSub AddSub (.clk(clk), .mag(mag), .dir(dir), .en(en), .rst(rst), .val(val), .intWatch(intWatch));

// ------zCntr------

wire [3:0] zCnt;

zCntr zCntr(.clk(clk), .rst(rst), .adj_val(val), .zCnt(zCnt));


initial begin
    clk = 1; dir = 0; en = 0; rst = 1; mag = 10'd0;  // initial values

    #20 rst = 0;  // release reset

    for 

    #10 en = 1; mag = 11'd5; dir = 0;  // add 5 55
    #10 mag = 11'd3; dir = 1;         // subtract 3  52
    #10 mag = 11'd2; dir = 1;        // sub 2  50
    #10 mag = 11'd50; dir = 1;      // sub 50 0 
    #10 mag = 11'd3; dir = 0;         // adds 3 3  WHY DOES THIS EQUAL 47
    #10 mag = 11'd3; dir = 0;         // add 3 6
    #10 mag = 11'd6; dir = 1;         // sub 6 0 
    #10 mag = 11'd1; dir = 0;         // add 1 1

    

    #35 $finish;
end

endmodule
