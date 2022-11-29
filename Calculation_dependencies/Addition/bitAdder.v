`timescale 1ns / 1ps

module bitAdder
(
	input A_in, B_in, Carry_in,
	output Sum_out, Carry_out
);

xor (Sum_out, A_in, B_in, Carry_in); //if 1 or all 3 of A, B, and Carry_in are 1, then Sum_out is 1

wire AB, AC, BC;
and (AB, A_in, B_in);
and (AC, A_in, Carry_in);
and (BC, B_in, Carry_in);

or (Carry_out, AB, AC, BC); //if 2 or more of A, B, or the Carry_in are 1, then the Carry_out is 1

endmodule