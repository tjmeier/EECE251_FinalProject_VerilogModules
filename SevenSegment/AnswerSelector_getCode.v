`timescale 1ns / 1ps

module AnswerSelector_getCode
(
	input up_button, down_button, center_button, clk, //uses FSM with up, down, and center button
	output [2:0]out_answer_select_code //outputs an answer_code to navigate which group of 4 digits is selected to be outputed
);

wire [2:0] code, next_code;
wire up_pulse, down_pulse, center_pulse;

assign out_answer_select_code = code;

//Use debouncer module on the 3 inputted button
debouncer debouncer1(
    .clk(clk),
    .PB(up_button),
    .PB_up(up_pulse)
    );
    
debouncer debouncer2(
    .clk(clk),
    .PB(down_button),
    .PB_up(down_pulse)
    );
    
debouncer debouncer3(
    .clk(clk),
    .PB(center_button),
    .PB_up(center_pulse)
    );
    
//3-bit register with current state = code[2:0], next state = next_code[2:0]

dff code0 (
	.data_out(code[0]),
	.in_D( next_code[0] ),
	.in_CLK( clk )
);

dff code1 (
	.data_out(code[1]),
	.in_D( next_code[1] ),
	.in_CLK( clk )
);

dff code2 (
	.data_out(code[2]),
	.in_D( next_code[2] ),
	.in_CLK( clk )
);

/////////////////////////////////////////////
///////Combinational Controller logic////////
/////////////////////////////////////////////

//setting not wires
wire upNOT, downNOT, centerNOT;

not (upNOT, up_pulse);
not (downNOT, down_pulse);
not (centerNOT, center_pulse);

wire [2:0]codeNOT;

not (codeNOT[2], code[2]);
not (codeNOT[1], code[1]);
not (codeNOT[0], code[0]);

//setting xor/xnor wires
wire upXNORdown, upXORdown, code1XORcode0;

xnor(upXNORdown, up_pulse, down_pulse);
xor(upXORdown, up_pulse, down_pulse);
xor(code1XORcode0, code[1], code[0]);

//setting misc wires needed in the terms
wire code1code0, code2ORcode1code0, upNANDdownNOT;

and (code1code0, code[1], code[0]);
or (code2ORcode1code0, code[2], code1code0);
nand (upNANDdownNOT, up_pulse, downNOT);

//////////////////////////////////
//////////next_code0//////////////

//setting next_code0 terms
wire [3:0]next_code0_terms;

and (next_code0_terms[0], code[0], upXNORdown);
and (next_code0_terms[1], code[1], codeNOT[0], upXORdown);
and (next_code0_terms[2], codeNOT[2], codeNOT[1], codeNOT[0], upNOT, down_pulse);
and (next_code0_terms[3], code[2], codeNOT[1], codeNOT[0], up_pulse, downNOT);

//or together next_code0 terms
wire next_code0_combined_terms;
or (next_code0_combined_terms, next_code0_terms[0],
next_code0_terms[1],next_code0_terms[2],next_code0_terms[3]);

//finalizing next_code0: adding in center button reset
and (next_code[0], next_code0_combined_terms, centerNOT);

//////////////////////////////////
//////////next_code1//////////////

//setting next_code1 terms
wire [2:0]next_code1_terms;

and (next_code1_terms[0], code1XORcode0, upNOT, down_pulse);
and (next_code1_terms[1], code[1], upXNORdown);
and (next_code1_terms[2], code2ORcode1code0, up_pulse, downNOT);


//or together next_code1 terms
wire next_code1_combined_terms;
or (next_code1_combined_terms, next_code1_terms[0],
next_code1_terms[1],next_code1_terms[2]);

//finalizing next_code1: adding in center button reset
and (next_code[1], next_code1_combined_terms, centerNOT);

//////////////////////////////////
//////////next_code2//////////////

//setting next_code1 terms
wire [1:0]next_code2_terms;

and (next_code2_terms[0], code[1], code[0], upNOT, down_pulse);
and (next_code2_terms[1], code[2], upNANDdownNOT);

//or together next_code1 terms
wire next_code2_combined_terms;
or (next_code2_combined_terms, next_code2_terms[0], next_code2_terms[1]);

//finalizing next_code1: adding in center button bit flip
xor (next_code[2], next_code2_combined_terms, center_pulse);

endmodule