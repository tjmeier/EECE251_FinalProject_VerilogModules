`timescale 1ns / 1ps

module anode_clock
(
	input clk,
	output anode_clk0, anode_clk1

);

//uses the clock signals to count through a 19 bit number and then loop back to zero after
//the 2 most significant bits of the 19 bit number 'q' can become a 2 bit counter to control the 
//anodes at a proper proper clock pace

wire [18:0]q;
wire [18:0]d;
wire [16:0]q_ands;


assign anode_clk0 = q[17];
assign anode_clk1 = q[18];

//18-bit register with bus d as next state and bus q as current state

dff bit0 (
	.data_out( q[0] ),
	.in_D( d[0] ),
	.in_CLK( clk )
);

dff bit1 (
	.data_out( q[1] ),
	.in_D( d[1] ),
	.in_CLK( clk )
);

dff bit2 (
	.data_out( q[2] ),
	.in_D( d[2] ),
	.in_CLK( clk )
);

dff bit3 (
	.data_out( q[3] ),
	.in_D( d[3] ),
	.in_CLK( clk )
);

dff bit4 (
	.data_out( q[4] ),
	.in_D( d[4] ),
	.in_CLK( clk )
);

dff bit5 (
	.data_out( q[5] ),
	.in_D( d[5] ),
	.in_CLK( clk )
);

dff bit6 (
	.data_out( q[6] ),
	.in_D( d[6] ),
	.in_CLK( clk )
);

dff bit7 (
	.data_out( q[7] ),
	.in_D( d[7] ),
	.in_CLK( clk )
);

dff bit8 (
	.data_out( q[8] ),
	.in_D( d[8] ),
	.in_CLK( clk )
);

dff bit9 (
	.data_out( q[9] ),
	.in_D( d[9] ),
	.in_CLK( clk )
);

dff bit10 (
	.data_out( q[10] ),
	.in_D( d[10] ),
	.in_CLK( clk )
);

dff bit11 (
	.data_out( q[11] ),
	.in_D( d[11] ),
	.in_CLK( clk )
);

dff bit12 (
	.data_out( q[12] ),
	.in_D( d[12] ),
	.in_CLK( clk )
);

dff bit13 (
	.data_out( q[13] ),
	.in_D( d[13] ),
	.in_CLK( clk )
);

dff bit14 (
	.data_out( q[14] ),
	.in_D( d[14] ),
	.in_CLK( clk )
);

dff bit15 (
	.data_out( q[15] ),
	.in_D( d[15] ),
	.in_CLK( clk )
);

dff bit16 (
	.data_out( q[16] ),
	.in_D( d[16] ),
	.in_CLK( clk )
);

dff bit17 (
	.data_out( q[17] ),
	.in_D( d[17] ),
	.in_CLK( clk )
);

dff bit18 (
	.data_out( q[18] ),
	.in_D( d[18] ),
	.in_CLK( clk )
);

//Calculating the q_ands recursively
and AND2(q_ands[0], q[1], q[0]);		//q1q0
and AND3(q_ands[1], q[2], q_ands[0]);	//q2q1q0
and AND4(q_ands[2], q[3], q_ands[1]);   //q3q2q1q0
and AND5(q_ands[3], q[4], q_ands[2]);   //q4q3q2q1q0
and AND6(q_ands[4], q[5], q_ands[3]);   // ..........
and AND7(q_ands[5], q[6], q_ands[4]);  
and AND8(q_ands[6], q[7], q_ands[5]);  
and AND9(q_ands[7], q[8], q_ands[6]);  
and AND10(q_ands[8], q[9], q_ands[7]);  
and AND11(q_ands[9], q[10], q_ands[8]);  
and AND12(q_ands[10], q[11], q_ands[9]);  
and AND13(q_ands[11], q[12], q_ands[10]);  
and AND14(q_ands[12], q[13], q_ands[11]);  
and AND15(q_ands[13], q[14], q_ands[12]);  
and AND16(q_ands[14], q[15], q_ands[13]);  
and AND17(q_ands[15], q[16], q_ands[14]);  // ....................
and AND18(q_ands[16], q[17], q_ands[15]);  //q17q16q15q14q13q12q11q10q9q8q7q6q5q4q3q2q1q0

//Assigning values to next state
not NOT(d[0], q[0]);
xor XOR1(d[1], q[0], q[1]);
xor XOR2(d[2], q_ands[0], q[2]);
xor XOR3(d[3], q_ands[1], q[3]);
xor XOR4(d[4], q_ands[2], q[4]);
xor XOR5(d[5], q_ands[3], q[5]);
xor XOR6(d[6], q_ands[4], q[6]);
xor XOR7(d[7], q_ands[5], q[7]);
xor XOR8(d[8], q_ands[6], q[8]);
xor XOR9(d[9], q_ands[7], q[9]);
xor XOR10(d[10], q_ands[8], q[10]);
xor XOR11(d[11], q_ands[9], q[11]);
xor XOR12(d[12], q_ands[10], q[12]);
xor XOR13(d[13], q_ands[11], q[13]);
xor XOR14(d[14], q_ands[12], q[14]);
xor XOR15(d[15], q_ands[13], q[15]);
xor XOR16(d[16], q_ands[14], q[16]);
xor XOR17(d[17], q_ands[15], q[17]);
xor XOR18(d[18], q_ands[16], q[18]);

endmodule