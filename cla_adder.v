`timescale 1ns/1ps
`define DELAY #10

// Verilog code for carry look-ahead adder
module cla_adder (in1, in2, cin, sum, cout);
parameter N = 32;
input [N - 1:0] in1;
input [N - 1:0] in2;
input cin;
output [N - 1:0] sum;
output cout;

//assign {cout, sum} = in1 + in2 + cin;

wire [N - 1:0] gen;
wire [N - 1:0] pro;
wire [N:0] c_temp;

genvar j, i;
generate
//assume c_temp in is zero
 assign c_temp[0] = cin;
 
 //carry generate function
 for(j = 0; j < N; j = j + 1) begin: carry_functions
 assign gen[j] = in1[j] & in2[j];
 assign pro[j] = in1[j] | in2[j];
 assign c_temp[j+1] = gen[j] | pro[j] & c_temp[j];
 end
 
 //carry out 
 assign cout = c_temp[N];
 
 //calculate sum 
 
 for(i = 0; i < N; i = i+1) begin: sum_without_carry
 assign sum[i] = in1[i] ^ in2[i] ^ c_temp[i];
 end 
endgenerate 
endmodule