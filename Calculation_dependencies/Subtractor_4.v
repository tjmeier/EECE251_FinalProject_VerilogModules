`timescale 1ns / 1ps

module Subtractor_4
(
	input [3:0] A_in4, B_in4, 
	input Carry_in,
	output [3:0] Diff_out4,
	output Carry_out
);

wire [3:0] Carry;

assign Carry[0] = Carry_in;

bitSubtractor sub_bit0 (
	.A_in( A_in4[0] ),
	.B_in( B_in4[0] ),
	.Carry_in( Carry[0] ),
	
	.Diff_out( Diff_out4[0] ),
	.Carry_out( Carry[1] )
);

bitSubtractor sub_bit1 (
	.A_in( A_in4[1] ),
	.B_in( B_in4[1] ),
	.Carry_in( Carry[1] ),
	
	.Diff_out( Diff_out4[1] ),
	.Carry_out( Carry[2] )
);

bitSubtractor sub_bit2 (
	.A_in( A_in4[2] ),
	.B_in( B_in4[2] ),
	.Carry_in( Carry[2] ),
	
	.Diff_out( Diff_out4[2] ),
	.Carry_out( Carry[3] )
);

bitSubtractor sub_bit3 (
	.A_in( A_in4[3] ),
	.B_in( B_in4[3] ),
	.Carry_in( Carry[3] ),
	
	.Diff_out( Diff_out4[3] ),
	.Carry_out( Carry_out )
);

endmodule
