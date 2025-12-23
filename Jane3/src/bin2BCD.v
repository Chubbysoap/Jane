`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2025 10:07:08 AM
// Design Name: 
// Module Name: bin2BCD
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


module bin2BCD(
  input [7:0] binary_in,      // 8-bit binary input (0-255)
  
  output reg [11:0] bcd_out   // 12-bit BCD output (3 digits)
);

  integer i,j;
  always @(*) begin
    bcd_out = 12'd0;
    
    //for each bit of in
    for (j = 7; j >= 0; j = j - 1) begin
      //check if BCD bytes are >=5
      for (i = 2; i >= 0; i = i - 1) begin
         // Add 3 to each digit if >=5 (pre-shift correction)
        if (bcd_out[((i+1)*4)-1 -:4] >=5 ) bcd_out[((i+1)*4)-1 -:4]  = bcd_out[((i+1)*4)-1 -:4] + 3;  
      end
    
      // Shift left: Carry from lower to higher digits, all but the Least Sig Byte
      for (i = 2; i >= 1; i = i - 1) begin
        bcd_out[((i+1)*4)-1 -:4] = {bcd_out[((i+1)*4)-2 -:3], bcd_out[((i+1)*4)-5]};
      end
      bcd_out[3:0] = {bcd_out[2:0], binary_in[j]};
          // Combine into output
    end
  end
endmodule