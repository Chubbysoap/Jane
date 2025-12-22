`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2025 09:05:13 AM
// Design Name: 
// Module Name: minMaxAdj
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


  module minMaxAdj(
  input en,
  input [39:0] in,
  input minMaxSel,
  input [3:0] len,
  
  output reg [39:0] adjVal,
  output reg [3:0] adjLen // represents the N in 10^N that will be used to split the min and max values
    );
    
    integer i, start; 
    
    always @* begin 
      if (len % 2 == 1) begin  //if odd
        start = 1;
        if (!minMaxSel) begin // min case
          i = 0;
          adjLen = (len + 1'd1);
          while (i < len) begin
            start = start * 4'd10;
            i = i + 1;   
          end  // while end     
          adjVal = start;
        end // min end
        
        
        else begin // max case
          i = 1; 
          adjLen = (len - 1'd1);
          while (i < len) begin
            start = start * 4'd10;
            i = i + 1;          
          end
          adjVal = start - 1'd1;
        end end else begin 
          adjVal = in;
          adjLen = len;
        end
        
      end //always end
endmodule
