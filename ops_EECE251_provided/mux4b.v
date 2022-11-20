module mux4b #(parameter k=1 ) //bus width
(	
	input  [k-1:0] in3,in2,in1,in0,
	input [1:0] sel,
	output reg [k-1:0] out
);
	//multiplexer
	always@ (*)
		case(sel)
			2'b00: out=in0;
			2'b01: out=in1;
			2'b10: out=in2;
			2'b11: out=in3;
			default: out={k{1'bx}};
		endcase
endmodule