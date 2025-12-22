`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2025 09:57:46 AM
// Design Name: 
// Module Name: AddSub
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


module AddSub(
    input clk,
    input [9:0] mag,
    input dir, // 0 add 1 sub
    input en,  //enable
    input rst, // reset
    output reg [6:0] val,
    output signed [11:0] intWatch
    );
    
     reg signed [11:0] intermediate;
    
    assign intWatch = intermediate;
    
    always @(posedge clk) begin
        if (rst) begin
            intermediate <= 12'd50;  // initial value on reset
        end
        // introduct mag properly
        else if (en) begin
            if (dir)
                intermediate <= intermediate - mag;
                              
            else
                intermediate <= intermediate + mag;
        end
        
    end
    
    always @(negedge clk) begin
    
      if (intermediate < 0) begin
        val <= 99 - ((-intermediate)%100);
        intermediate <= val;
      end
      else if (intermediate > 99) begin
        val <= intermediate % 100;
        intermediate <= val;
      end
      else
        val <= intermediate[6:0];
    end
        
        
endmodule
