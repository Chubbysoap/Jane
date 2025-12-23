`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2025 05:27:45 PM
// Design Name: 
// Module Name: joltFinder
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


module joltFinder(
  input [19:0] bcdIn,
  
  output reg [7:0] maxJoltBCD,
  output reg [7:0] pos
    );
    
  integer i,j;
  //integer pos;
    
  always @(*) begin
    maxJoltBCD = 8'b0;
    //iterate through BCD for the first time
    maxJoltBCD[7-:4] = bcdIn[19 -:4];
    pos = 4;
    //Most Significant Bit Find
    for (i = 3; i >= 1; i = i - 1) begin // stop 1 before end
      //go through
      if (maxJoltBCD[7-:4] <= bcdIn[((i+1)*4)-1 -:4]) begin 
        maxJoltBCD[7-:4]= bcdIn[((i+1)*4)-1 -:4];
        pos = i;
      end
    end
    
    //Least Sig Bit find
    for (i = pos-1; i >= 0; i = i - 1) begin
      //go through
      if (maxJoltBCD[3-:4] <= bcdIn[((i+1)*4)-1 -:4]) begin 
        maxJoltBCD[3-:4]= bcdIn[((i+1)*4)-1 -:4];
      end
    end
    
  end
  
endmodule
