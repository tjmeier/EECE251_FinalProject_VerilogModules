`timescale 1ns / 1ps

module Adder_32
(
	input [31:0] A_in32, B_in32, 
	input Carry_in,
	output [31:0] Sum_out32,
	output Carry_out
);

wire Carry;


Adder_16 add_bit0to15 (
	.A_in16( A_in32[15:0] ),
	.B_in16( B_in32[15:0] ),
	.Carry_in( Carry_in ),
	
	.Sum_out16( Sum_out32[15:0] ),
	.Carry_out( Carry )
);

Adder_16 add_bit16to31 (
	.A_in16( A_in32[31:16] ),
	.B_in16( B_in32[31:16] ),
	.Carry_in( Carry ),
	
	.Sum_out16( Sum_out32[31:16] ),
	.Carry_out( Carry_out )
);

endmodule