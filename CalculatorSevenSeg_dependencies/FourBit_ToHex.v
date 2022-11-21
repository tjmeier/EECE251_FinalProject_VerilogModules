`timescale 1ns / 1ps

module FourBit_ToHex
(
	input [3:0]four_bit,
	input en,
	output [6:0]Hex_Digit
);

wire X6_0, X6_2, X6_3, X6_5, X6_6, X6_7, X6_8, X6_9, X6_10, X6_12, X6_14, X6_15, X42_0, X42_1, X42_2, X42_3, X42_4, X42_6, X42_7, X42_8, X42_9, X42_10, X42_12, X42_13, X42_15, X42_16, X60_0, X60_1, X60_3, X60_4, X60_5, X60_6, X60_7, X60_8, X60_9, X60_10, X60_11, X60_13, X60_15, X60_16, X78_0, X78_2, X78_3, X78_5, X78_6, X78_8, X78_9, X78_10, X78_11, X78_12, X78_13, X78_14, X78_16, X96_0, X96_2, X96_4, X96_5, X96_6, X96_8, X96_10, X96_11, X96_12, X96_13, X96_14, X96_15, X114_0, X114_2, X114_3, X114_4, X114_5, X114_6, X114_8, X114_9, X114_11, X114_12, X114_14, X114_15, X148_1, X148_2, X148_3, X148_4, X148_5, X148_6, X148_8, X148_9, X148_10, X148_11, X148_13, X148_14, X148_15;

//CA
decoder #(4,1) U6 (
	.data_out( {1'bx,1'bx,X6_14,1'bx,X6_12,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,X6_5,1'bx,1'bx,X6_2,1'bx} ),
	.address_in( {four_bit[3],four_bit[2],four_bit[1],four_bit[0]} ),
	.en_in( en)
);

or U23 (Hex_Digit[0],X6_2, X6_5, X6_12, X6_14);


//CB
decoder #(4,1) U42 (
	.data_out( {X42_16,X42_15,1'bx,X42_13,X42_12,1'bx,1'bx,1'bx,1'bx,X42_7,X42_6,1'bx,1'bx,1'bx,1'bx,1'bx} ),
	.address_in( {four_bit[3],four_bit[2],four_bit[1],four_bit[0]} ),
	.en_in( en)
);

or U46 (Hex_Digit[1],X42_6, X42_7, X42_12, X42_13, X42_15, X42_16);


//CC

decoder #(4,1) U60 (
	.data_out( {X60_16,X60_15,1'bx,X60_13,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,X60_3,1'bx,1'bx} ),
	.address_in( {four_bit[3],four_bit[2],four_bit[1],four_bit[0]} ),
	.en_in( en)
);

or U64 (Hex_Digit[2],X60_3, X60_13, X60_15, X60_16);


//CD

decoder #(4,1) U78 (
	.data_out( {X78_16,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,X78_8,1'bx,1'bx,X78_5,1'bx,1'bx,X78_2,1'bx} ),
	.address_in( {four_bit[3],four_bit[2],four_bit[1],four_bit[0]} ),
	.en_in( en)
);

or U82 (Hex_Digit[3],X78_2, X78_5, X78_8, X78_16);


//CE

decoder #(4,1) U96 (
	.data_out( {1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,X96_10,1'bx,X96_8,1'bx,X96_6,X96_5,X96_4,1'bx,X96_2,1'bx} ),
	.address_in( {four_bit[3],four_bit[2],four_bit[1],four_bit[0]} ),
	.en_in( en)
);

or U100 (Hex_Digit[4],X96_2, X96_4, X96_5, X96_6, X96_8, X96_10);


//CF

decoder #(4,1) U114 (
	.data_out( {1'bx,1'bx,X114_14,1'bx,1'bx,X114_11,1'bx,1'bx,X114_8,1'bx,1'bx,1'bx,X114_4,X114_3,X114_2,1'bx} ),
	.address_in( {four_bit[3],four_bit[2],four_bit[1],four_bit[0]} ),
	.en_in( en)
);

or U118 (Hex_Digit[5],X114_2, X114_3, X114_4, X114_8, X114_11, X114_14);


//CG

decoder #(4,1) U148 (
	.data_out( {1'bx,1'bx,1'bx,X148_13,1'bx,1'bx,1'bx,1'bx,X148_8,1'bx,1'bx,1'bx,1'bx,1'bx,X148_2,X148_1} ),
	.address_in( {four_bit[3],four_bit[2],four_bit[1],four_bit[0]} ),
	.en_in( en)
);

or U152 (Hex_Digit[6],X148_1, X148_2, X148_8, X148_13);

endmodule