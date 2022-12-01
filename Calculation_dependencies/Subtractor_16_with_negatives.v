`timescale 1ns / 1ps

module Subtractor_16_with_negatives
(
	input [15:0] A_in16, B_in16, 
	input Carry_in,
	output [15:0] Positive_Diff16,
	output Is_negative
);

wire [15:0] Positive_Diff16, Negative_Diff16;
//when the overall difference is negative, the 2s compliment needs to be taken on
//Positive_Diff16 in order to derivce Negative_Diff16.

wire [4:0] Carry;

assign Carry[0] = Carry_in;

Subtractor_4 sub_bit0to3 (
	.A_in4( A_in16[3:0] ),
	.B_in4( B_in16[3:0] ),
	.Carry_in( Carry[0] ),
	
	.Diff_out4( Positive_Diff16[3:0] ),
	.Carry_out( Carry[1] )
);

Subtractor_4 sub_bit4to7 (
	.A_in4( A_in16[7:4] ),
	.B_in4( B_in16[7:4] ),
	.Carry_in( Carry[1] ),
	
	.Diff_out4( Positive_Diff16[7:4] ),
	.Carry_out( Carry[2] )
);

Subtractor_4 sub_bit8to11 (
	.A_in4( A_in16[11:8] ),
	.B_in4( B_in16[11:8] ),
	.Carry_in( Carry[2] ),
	
	.Diff_out4( Positive_Diff16[11:8] ),
	.Carry_out( Carry[3] )
);

Subtractor_4 sub_bit12to15 (
	.A_in4( A_in16[15:12] ),
	.B_in4( B_in16[15:12] ),
	.Carry_in( Carry[3] ),
	
	.Diff_out4( Positive_Diff16[15:12] ),
	.Carry_out( Carry_out )
);

//Taking 2s compliment of Positive_Diff16 to get Negative_Diff16

endmodule