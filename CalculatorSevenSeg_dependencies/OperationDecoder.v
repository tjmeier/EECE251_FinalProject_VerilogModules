`timescale 1ns / 1ps

module OperationDecoder
(
	input [2:0]operation,
	output [6:0]opletter0, [6:0]opletter1, [6:0]opletter2, [6:0]opletter3
);

//translates the encoded operation to letters to be outputed to seven segment display
//for the operation input bus: 001 = Add	010 = SUb	100 = MUL
//if any other code is submitted, the seven segment display will be blank

//for the four bit comments below: ABCD, A = 000, B = 001, C = 010, D = 100

wire X18, X88, X123, X160, X213, X237;

assign opletter0[0] = 1'b1; //1111
assign opletter1[0] = 1'b1;
assign opletter3[2] = 1'b1;
assign opletter3[3] = 1'b1;
assign opletter3[6] = 1'b1;

assign opletter0[3] = X18; //1000
assign opletter0[4] = X18;
assign opletter1[1] = X18;
assign opletter1[2] = X18;
assign opletter1[3] = X18;
assign opletter1[4] = X18;
assign opletter2[0] = X18;
assign opletter2[2] = X18;
assign opletter2[5] = X18;

assign opletter0[2] = X88; //1001
assign opletter0[6] = X88;
assign opletter2[6] = X88;

assign opletter0[1] = X123; //1011
assign opletter1[6] = X123;
assign opletter2[4] = X123;

assign opletter0[5] = X160; //1100
assign opletter1[5] = X160;

assign opletter3[0] = X237; //1110
assign opletter3[1] = X237;
assign opletter3[4] = X237;
assign opletter3[5] = X237;




mux #(8,1) U18 (
	.data_out(X18),
	.select_in( {operation[2],operation[1],operation[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b0,1'b1,1'b0,1'b0,1'b1} )
);

mux #(8,1) U88 (
	.data_out(X88),
	.select_in( {operation[2],operation[1],operation[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1} )
);

mux #(8,1) U123 (
	.data_out(X123),
	.select_in( {operation[2],operation[1],operation[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1} )
);

mux #(8,1) U160 (
	.data_out(X160),
	.select_in( {operation[2],operation[1],operation[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b0,1'b1,1'b0,1'b1,1'b1} )
);

mux #(8,1) U193 (
	.data_out(opletter2[3]), //directly assigned, 1101
	.select_in( {operation[2],operation[1],operation[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1} )
);

mux #(8,1) U213 (
	.data_out(opletter2[1]), //directly assigned, 1010
	.select_in( {operation[2],operation[1],operation[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1} )
);

mux #(8,1) U237 (
	.data_out(X237),
	.select_in( {operation[2],operation[1],operation[0]} ),
	.data_in( {1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1} )
);

endmodule
