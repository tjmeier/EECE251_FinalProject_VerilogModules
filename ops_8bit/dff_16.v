`timescale 1ns / 1ps

module dff_16(
    input [15:0] d_16,
    input clk_in,
    output [15:0] q_16
);

//uses the data flip-flop module 16 times to serve as a 16-bit register

dff bit0 (
	.data_out( q_16[0] ),
	.in_D( d_16[0] ),
	.in_CLK( clk_in )
);

dff bit1 (
	.data_out( q_16[1] ),
	.in_D( d_16[1] ),
	.in_CLK( clk_in )
);

dff bit2 (
	.data_out( q_16[2] ),
	.in_D( d_16[2] ),
	.in_CLK( clk_in )
);

dff bit3 (
	.data_out( q_16[3] ),
	.in_D( d_16[3] ),
	.in_CLK( clk_in )
);

dff bit4 (
	.data_out( q_16[4] ),
	.in_D( d_16[4] ),
	.in_CLK( clk_in )
);

dff bit5 (
	.data_out( q_16[5] ),
	.in_D( d_16[5] ),
	.in_CLK( clk_in )
);

dff bit6 (
	.data_out( q_16[6] ),
	.in_D( d_16[6] ),
	.in_CLK( clk_in )
);

dff bit7 (
	.data_out( q_16[7] ),
	.in_D( d_16[7] ),
	.in_CLK( clk_in )
);

dff bit8 (
	.data_out( q_16[8] ),
	.in_D( d_16[8] ),
	.in_CLK( clk_in )
);

dff bit9 (
	.data_out( q_16[9] ),
	.in_D( d_16[9] ),
	.in_CLK( clk_in )
);

dff bit10 (
	.data_out( q_16[10] ),
	.in_D( d_16[10] ),
	.in_CLK( clk_in )
);

dff bit11 (
	.data_out( q_16[11] ),
	.in_D( d_16[11] ),
	.in_CLK( clk_in )
);

dff bit12 (
	.data_out( q_16[12] ),
	.in_D( d_16[12] ),
	.in_CLK( clk_in )
);

dff bit13 (
	.data_out( q_16[13] ),
	.in_D( d_16[13] ),
	.in_CLK( clk_in )
);

dff bit14 (
	.data_out( q_16[14] ),
	.in_D( d_16[14] ),
	.in_CLK( clk_in )
);

dff bit15 (
	.data_out( q_16[15] ),
	.in_D( d_16[15] ),
	.in_CLK( clk_in )
);


endmodule