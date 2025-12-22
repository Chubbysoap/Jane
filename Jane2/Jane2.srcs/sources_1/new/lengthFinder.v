`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 09:19:25 AM
// Design Name: 
// Module Name: lengthFinder
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


module lengthFinder(
  input clk,
  input en,
  input rst,
  input [31:0] min,
  input [31:0] max,
  
  //nfound
  output reg minHit,
  output reg maxHit,
  //nval
  output reg [3:0] minN,  //for these if length is odd, output up to even for min, down to even for max.
  output reg [3:0] maxN,   //  min = 123 -> lmin = 1000 || max = 123 -> lmax = 100;
  //adjusted range
  output reg [31:0] amin,
  output reg [31:0] amax
  );
    
 
  always @* begin  // combinational
    if (rst) begin
      minN = 4'b0;
      maxN = 4'b0;
      maxHit = 1'b0;
      minHit = 1'b0;
      
    end else if (en) begin
      if (min == 0) minN = 4'd1;
      else if (min < 10) begin 
        minN = 4'd2; 
        amin = 32'd10;
       end   //set to 2 because no repeats in odd
      else if (min < 100) begin
        minN = 4'd2;
        amin = min;
      end
      else if (min < 1000) begin
        minN = 4'd4;
        amin = 32'd1000;
      end
      else if (min < 10000) begin 
        minN = 4'd4;
        amin = min;
      end
      else if (min < 100000) begin
        minN = 4'd6;
        amin = 32'd100000;
      end
      else if (min < 1000000) begin 
        minN = 4'd6;
        amin = min;
      end
      else if (min < 10000000) begin 
        minN = 4'd8;
        amin = 32'd10000000;
      end
      else if (min < 100000000) begin
        minN = 4'd8;
        amin = min;
      end
      else begin 
        minN = 4'd10;
        amin = 32'd1000000000;
        minHit = 1'b1;  // always done in one cycle so probably not necesary
      end
    end
end // always end


 always @* begin  // combinational
  if (rst) begin
      minN = 4'b0;
      maxN = 4'b0;
      maxHit = 1'b0;
      minHit = 1'b0;
   end else if (en) begin
  if (max == 0) maxN = 4'd1;
    else if (max < 10) begin 
      maxN = 4'd0;
      //amax = 32'b0;
    end 
    else if (max < 100) begin 
      maxN = 4'd2;
      amax = max;
    end
    else if (max < 1000) begin 
      maxN = 4'd2;
      amax = 32'd99;
    end
    else if (max < 10000) begin 
      maxN = 4'd4;
      amax = max;
    end
    else if (max < 100000) begin
      maxN = 4'd4;
      amax = 32'd9999;
    end
    else if (max < 1000000) begin
      maxN = 4'd6;
      amax = max;
    end
    else if (max < 10000000) begin
      maxN = 4'd6;
      amax = 32'd999999; 
    end
    else if (max < 100000000) begin
      maxN = 4'd8;
      amax = max;
    end
    else if (max < 1000000000) begin
      maxN = 4'd8;
      amax = 32'd99999999;
    end
    else begin 
      maxN = 4'd10;
      amax = max;
    end
  end
end // always end

endmodule
