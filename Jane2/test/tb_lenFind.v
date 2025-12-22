`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 10:37:20 AM
// Design Name: 
// Module Name: tb_lenFind
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


module tb_lenFind( );

// 1-bit inputs
reg en, rst;
//2+bit ins
reg [31:0] in; 


wire [3:0] len;

lengFind DUT(.en(en), .rst(rst), .in(in), .len(len));


initial begin
  en = 0; rst = 1; in = 32'd0;
    
  #20 rst = 0;  // release reset

  #10 en = 1; in = 32'd1010;

  #10 en = 1; in = 32'd1;
  #10 en = 1; in = 32'd12;
  #10 en = 1; in = 32'd1234;
  #10 en = 1; in = 32'd12345;
  #10 en = 1; in = 32'd123456;
  #10 en = 1; in = 32'd1234567;


  #10;
end
endmodule
