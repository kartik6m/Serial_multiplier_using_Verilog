
`timescale 1ns/1ps
`define DELAY 10
module cla_multiplier (M, Q, product);
parameter M_WID = 32;
parameter Q_WID = 32;

input [M_WID-1:0] M;
input [Q_WID-1:0] Q;
output [(M_WID + Q_WID - 1):0] product;


wire [M_WID - 1:0] M_tmp [Q_WID-1:0];
wire [M_WID - 1:0] product_tmp [Q_WID-1:0];
wire [Q_WID -1:0] carry_tmp;
///using generate block to create blocks.
generate 
genvar	i,j,k;
 //initialize values
 for(j = 0; j < Q_WID; j = j + 1) begin: for_loop_j
 assign M_tmp[j] =  M & {M_WID{Q[j]}};		//obtain multiplicands for each position
 end
 
 assign product_tmp[0] = M_tmp[0];
 assign carry_tmp[0] = 1'b0;				//initial carry bit
 assign product[0] = product_tmp[0][0];//LSB of final output.

 for(i = 1; i < Q_WID; i = i + 1)
 begin: for_loop_i
cla_adder #(.N(Q_WID)) add1 (
     // Outputs
     .sum(product_tmp[i]),
     .cout(carry_tmp[i]),
     // Inputs
   .cin(1'b0),
     .in1(M_tmp[i]),
     .in2({carry_tmp[i-1],product_tmp[i-1][31-:31]})); /*dynamic array slicing 
	  for selecting part of partial product except LSB.*/
	  
	  /* send (current stage multiplicand ,
	  {carry and most significant part(except lsb) of previous stage}) to CLA*/
 assign product[i] = product_tmp[i][0]; //set LSB of each stage partial product sum as product bit.
 end //end for loop
 
 assign product[(Q_WID+Q_WID-1):Q_WID] = {carry_tmp[Q_WID-1],product_tmp[Q_WID-1][31-:31]};//for the last stage partial product sum
endgenerate
endmodule

