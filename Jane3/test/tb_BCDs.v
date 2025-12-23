`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2025 11:06:58 AM
// Design Name: 
// Module Name: tb_BCDs
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


module tb_BCDs();
//in
reg [330:0] binary_in;

//2 output, should be the same

wire [11:0] out0, out1;


bin2BCD DUT(.binary_in(binary_in), .bcd_out(out1));

initial begin

binary_in = 8'd123;
#5;


end
endmodule
