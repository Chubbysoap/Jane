`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 10:03:41 AM
// Design Name: 
// Module Name: invalidCntr
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


module invalidCntr(
  input en,
  input [3:0] adjLen,
  input [39:0] min,
  input [39:0] max,
  
  output reg [49:0] invCnt,
  output reg [39:0] testPoint
    );

  reg [19:0] splitter;
  reg [19:0] TsplitMin;
  //reg [31:0] testPoint;
  
  always @(*) begin
  if (en) begin
  // get the splitter
    case (adjLen[3:1])
      3'b001: splitter = 17'd10;
      3'b010: splitter = 17'd100;
      3'b011: splitter = 17'd1000;
      3'b100: splitter = 17'd10000;
     default: splitter = 17'd100000;
    endcase 
  // split the min ( option here to find midpoint bw min and max, count up from min to mid point, and down from max to mid point, watch for midpoint being x.5 this would miss a val 
  // temp test out
    TsplitMin = min/splitter;
    testPoint = TsplitMin*splitter + TsplitMin;
    invCnt = 40'd0;
    // ensure we start withing the range
    while( testPoint < min) begin
      TsplitMin = TsplitMin + 1'b1;
      testPoint = TsplitMin*splitter + TsplitMin;
    end
    
    // check to see if range has been violated
    if ( min <= testPoint && testPoint <= max) begin
      while( min <= testPoint && testPoint <= max) begin
      
        invCnt = invCnt + testPoint;
        
        TsplitMin = TsplitMin + 1'b1;
        testPoint = TsplitMin*splitter + TsplitMin;
      end
    end else begin
      invCnt = 40'd0;
    end
  end
  end
endmodule
