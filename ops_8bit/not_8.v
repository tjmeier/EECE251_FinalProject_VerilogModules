`timescale 1ns / 1ps

module not_8(
    output [7:0] out,
	input [7:0] in
);

not NOT0 ( out[0], in[0] );
not NOT1 ( out[1], in[1] );
not NOT2 ( out[2], in[2] );
not NOT3 ( out[3], in[3] );
not NOT4 ( out[4], in[4] );
not NOT5 ( out[5], in[5] );
not NOT6 ( out[6], in[6] );
not NOT7 ( out[7], in[7] );

endmodule
