`timescale 1ns / 1ps

module Subtractor_16
(
	input [15:0] A_in16, B_in16, 
	input Carry_in,
	output [15:0] Diff_out16,
	output Carry_out
);

wire [4:0] Carry;

assign Carry[0] = Carry_in;

Subtractor_4 sub_bit0to3 (
	.A_in4( A_in16[3:0] ),
	.B_in4( B_in16[3:0] ),
	.Carry_in( Carry[0] ),
	
	.Diff_out4( Diff_out16[3:0] ),
	.Carry_out( Carry[1] )
);

Subtractor_4 sub_bit4to7 (
	.A_in4( A_in16[7:4] ),
	.B_in4( B_in16[7:4] ),
	.Carry_in( Carry[1] ),
	
	.Diff_out4( Diff_out16[7:4] ),
	.Carry_out( Carry[2] )
);

Subtractor_4 sub_bit8to11 (
	.A_in4( A_in16[11:8] ),
	.B_in4( B_in16[11:8] ),
	.Carry_in( Carry[2] ),
	
	.Diff_out4( Diff_out16[11:8] ),
	.Carry_out( Carry[3] )
);

Subtractor_4 sub_bit12to15 (
	.A_in4( A_in16[15:12] ),
	.B_in4( B_in16[15:12] ),
	.Carry_in( Carry[3] ),
	
	.Diff_out4( Diff_out16[15:12] ),
	.Carry_out( Carry_out )
);
