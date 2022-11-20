module decoder #(parameter NUM_SEL = 2, parameter NUM_OUTPUT = 1) (

	input [(NUM_SEL-1):0] address_in,
	input en_in,
	output [((2**NUM_SEL)-1):0] data_out

);

assign data_out = (en_in<<address_in);

endmodule
