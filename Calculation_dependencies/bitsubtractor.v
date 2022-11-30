module bitSubtractor(
	input A_in,
	input B_in,
	input Carry_in,
	output Carry_out,
	output Diff_out
);

wire X10, X11, X12, X13, X14;


xor U5 (Diff_out,A_in, B_in, Carry_in);

or U9 (Carry_out,X10, X11, X12);

and U10 (X10,B_in, Carry_in);

and U11 (X11,X13, Carry_in);

and U12 (X12,X14, B_in);

not U13 (X13,A_in);

not U14 (X14,A_in);

endmodule
