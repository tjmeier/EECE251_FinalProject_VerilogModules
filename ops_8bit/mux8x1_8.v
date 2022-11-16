`timescale 1ns / 1ps

module mux8x1_8(
	input [7:0] i0, i1, i2, i3, i4, i5, i6, i7,
	input s2, s1, s1,
	output [7:0] o
);

//creates an 8x1 multiplexer for 8 bit buses

mux #(8,1) output_bit0 (
	.data_out(o[0]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[0],i6[0],i5[0],i4[0],i3[0],i2[0],i1[0],i0[0]} )
);

mux #(8,1) output_bit1 (
	.data_out(o[1]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[1],i6[1],i5[1],i4[1],i3[1],i2[1],i1[1],i0[1]} )
);

mux #(8,1) output_bit2 (
	.data_out(o[2]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[2],i6[2],i5[2],i4[2],i3[2],i2[2],i1[2],i0[2]} )
);

mux #(8,1) output_bit3 (
	.data_out(o[3]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[3],i6[3],i5[3],i4[3],i3[3],i2[3],i1[3],i0[3]} )
);

mux #(8,1) output_bit4 (
	.data_out(o[4]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[4],i6[4],i5[4],i4[4],i3[4],i2[4],i1[4],i0[4]} )
);

mux #(8,1) output_bit5 (
	.data_out(o[5]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[5],i6[5],i5[5],i4[5],i3[5],i2[5],i1[5],i0[5]} )
);

mux #(8,1) output_bit6 (
	.data_out(o[6]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[6],i6[6],i5[6],i4[6],i3[6],i2[6],i1[6],i0[6]} )
);

mux #(8,1) output_bit7 (
	.data_out(o[7]),
	.select_in( {s2,s1,s0} ),
	.data_in( {i7[7],i6[7],i5[7],i4[7],i3[7],i2[7],i1[7],i0[7]} )
);


endmodule
