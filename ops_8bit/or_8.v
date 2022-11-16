`timescale 1ns / 1ps

module or_8(
    output [7:0] out,
	input [7:0] in1, in2
);

or OR0 ( out[0], in1[0], in2[0] );
or OR1 ( out[1], in1[1], in2[1] );
or OR2 ( out[2], in1[2], in2[2] );
or OR3 ( out[3], in1[3], in2[3] );
or OR4 ( out[4], in1[4], in2[4] );
or OR5 ( out[5], in1[5], in2[5] );
or OR6 ( out[6], in1[6], in2[6] );
or OR7 ( out[7], in1[7], in2[7] );

endmodule