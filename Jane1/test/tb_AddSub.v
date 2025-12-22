`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2025 10:42:39 AM
// Design Name: 
// Module Name: tb_AddSub
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


module tb_AddSub();

// 1-bit inputs
reg clk, dir, en, rst;
//2+-bit inputs
reg [9:0] mag;

//output
wire [6:0] val;
wire [11:0] intWatch;

AddSub DUT (.clk(clk), .mag(mag), .dir(dir), .en(en), .rst(rst), .val(val), .intWatch(intWatch));

//RangeFixer DUT1 (.clk(clk), 

initial begin
    clk = 0; dir = 0; en = 0; rst = 1; mag = 10'd0;  // initial values

    #20 rst = 0;  // release reset

    #10 en = 1; mag = 10'd5; dir = 0;  // add 5
    #10 mag = 10'd3; dir = 1;         // subtract 3
    #10 mag = 10'd99; dir = 0;        // sub 99
    #35 $finish;
end

// Clock generator
always #5 clk = ~clk;


    initial $monitor("Time=%0t mag=%0d val=%0d", $time, mag, val);

endmodule 