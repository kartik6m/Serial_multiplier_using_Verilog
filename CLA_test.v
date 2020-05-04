`timescale 1ns/1ps
`define DELAY #10
module CLA_test;
parameter N = 8;
//  testbench code for carry look ahead adder
 reg cin; // To cla1 of cla_adder.v
 reg [N-1:0] in1; // To cla1 of cla_adder.v
 reg [N-1:0] in2; // To cla1 of cla_adder.v


 wire cout; // From cla1 of cla_adder.v
 wire [N-1:0] sum; // From cla1 of cla_adder.v


cla_adder a1(
        //  Outputs
         .sum (sum[N-1:0]),
         .cout (cout),
        // // Inputs
         .in1 (in1[N-1:0]),
         .in2 (in2[N-1:0]),
         .cin (cin));

 initial begin
  in1 = 8'd0;
  in2 = 8'd0;
  cin = 1'b0;
  end 

 initial begin
  #10 
  #10   in1 = 8'd10;
  #10   in1 = 8'd20;
  #10   in2 = 8'd10;
  #10  	in2 = 8'd20;
  #10   in2 = 8'd0;
  #30 	in1 = 8'd12; in2 = 8'd3;
  #30  in1 = 8'd4; in2 = 8'd14;
  #30  in1 = 8'd25; in2 = 8'd7;
  end 
 endmodule