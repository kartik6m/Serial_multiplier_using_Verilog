`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:02 04/24/2020 
// Design Name: 
// Module Name:    testbench_final 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tb;
 parameter MULTIPLICAND_WID = 32;
 parameter MULTIPLIER_WID = 32;

 reg [MULTIPLICAND_WID-1:0] m; 
 reg [MULTIPLIER_WID-1:0]q;
 
integer i;
wire [(MULTIPLICAND_WID+MULTIPLIER_WID-1):0]product;


 cla_multiplier mul1(
  
      .product (product[(MULTIPLICAND_WID+MULTIPLIER_WID-1):0]),
  
      .M(m[MULTIPLICAND_WID-1:0]),
     .Q(q[MULTIPLIER_WID-1:0]));

 initial begin
 for (i = 0; i < 30; i = i + 1) begin: W
  #(10) m = m + 1; q = q + 1;
   end
 
  #(10) 
  m = 32'd16;
  q = 32'd16;
 
  #(10) 
 m = 32'd6;
  q = 32'd2;
 
 
  #(10) 
m = 32'd16;
  q = 32'd23;
 
  #(10) 
 m = 32'd13;
 q = 32'd12;
 end
 endmodule