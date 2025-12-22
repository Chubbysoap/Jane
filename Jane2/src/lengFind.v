`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 04:12:20 PM
// Design Name: 
// Module Name: lengFind
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


module lengFind(
  input en,
  input rst,
  input [33:0] in, // item we wish to find the length of
  
  //length
  output reg [3:0] len
    );
    
    reg [33:0] temp;         // Temporary variable for digit extraction
    reg [33:0] inBwOut;  // Array to hold up to 10 digits (4 bits per digit for 0-9)
    integer i, len;    // Loop variables
    
  always @* begin
    if (rst) begin
      len = 4'b0;
    end else if (en) begin
    
        
      // Step 1: Handle special case if num is 0
      if (in == 0) begin
          len = 4'b0;
      end else begin
          // Step 2: Extract digits (LSD first)
          temp = in;
          i = 0;
          while (temp > 0 && i < 10) begin  // Limit to 10 digits to prevent overflow
            temp = temp / 10;
            i = i + 1;
          end
          len = i;
          //adj len out properly
        
//          if ( len % 2 == 1 && !minMaxSel) begin
//            adjOut = 10 ** len; 
//            len = len + 1'b1;
//          end
          
      end   
    end
  end  
endmodule
