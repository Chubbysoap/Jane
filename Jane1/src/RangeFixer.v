`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2025 01:12:17 PM
// Design Name: 
// Module Name: RangeFixer
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



module RangeFixer(
    input clk,
    input signed [9:0] nf_val,
    output reg [6:0] adj_val
    );
   
  
   //will adjust value after given new value on posedge :)
    always @(posedge clk) begin
        if ( nf_val > 99) begin
          adj_val <= nf_val % 100;
        end
        else if ( nf_val < 0) begin 
          adj_val <= 99 - ((-nf_val)%100);
        end
        else 
        adj_val <= nf_val[6:0];
        
    
    end
    
endmodule
