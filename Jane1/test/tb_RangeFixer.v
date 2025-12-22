`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2025 01:44:19 PM
// Design Name: 
// Module Name: tb_RangeFixer
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

module tb_RangeFixer();
    reg clk;
    reg signed [9:0] nf_val;
    wire [6:0] adj_val;

    always #5 clk = ~clk;

    RangeFixer DUT (.clk(clk), .nf_val(nf_val), .adj_val(adj_val));

    initial begin
        clk = 0;
        nf_val = 0;

        #20 nf_val = 685;   // expect 85 (685 % 100)
        #20 nf_val = -120;  // expect ? depends on intent
        #20 nf_val = 45;    // should stay 45
        #20 $finish;
    end

    initial $monitor("Time=%0t nf_val=%0d adj_val=%0d", $time, nf_val, adj_val);
endmodule