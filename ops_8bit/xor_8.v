`timescale 1ns / 1ps

module xor_8(
    output [7:0] out,
	input [7:0] in1, in2
);

xor XOR0 ( out[0], in1[0], in2[0] );
xor XOR1 ( out[1], in1[1], in2[1] );
xor XOR2 ( out[2], in1[2], in2[2] );
xor XOR3 ( out[3], in1[3], in2[3] );
xor XOR4 ( out[4], in1[4], in2[4] );
xor XOR5 ( out[5], in1[5], in2[5] );
xor XOR6 ( out[6], in1[6], in2[6] );
xor XOR7 ( out[7], in1[7], in2[7] );

endmodule