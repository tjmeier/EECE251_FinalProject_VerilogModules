`timescale 1ns / 1ps

module AnswerSelector_4digitsToOutput
(
	input [6:0] fullAnswer_Digit0, fullAnswer_Digit1, fullAnswer_Digit2, fullAnswer_Digit3,
    fullAnswer_Digit4, fullAnswer_Digit5, fullAnswer_Digit6, fullAnswer_Digit7, //from NumberDecoder_upto8HexDigits
    input [2:0] in_answer_select_code, //from AnswerSelector_getCode

    output [6:0] AnswerDigitToOutput0, AnswerDigitToOutput1, AnswerDigitToOutput2, AnswerDigitToOutput3 //to board's seven segment
);

/*
in_answer_select_code           X = the digit from full answer which will become AnswerDigitToOutputX
.                               fullAnswer_Digit 7, 6, 5, 4, 3, 2, 1, 0

000                                              -  -  -  -  3  2  1  0
001                                              -  -  -  3  2  1  0  -
010                                              -  -  3  2  1  0  -  -
011                                              -  3  2  1  0  -  -  -
100                                              3  2  1  0  -  -  -  -

Example: when in_answer_select_code = 010, AnswerDigitToOutput3 will be assigned the value in fullAnswer_Digit5
*/



//since there are 5 codes, we will need 2 muxes for each AnswerDigitToOutput

//we need these buses to connect the muxes
wire [6:0] DigitToOutput0_if_code2NOT, DigitToOutput1_if_code2NOT, DigitToOutput2_if_code2NOT, DigitToOutput3_if_code2NOT;


//assign AnswerDigitToOutput0
mux4b #(7) first_getAnswerDigitToOutput0(
    .in0( fullAnswer_Digit0 ),
    .in1( fullAnswer_Digit1 ),
    .in2( fullAnswer_Digit2),
    .in3( fullAnswer_Digit3 ),
    .sel( in_answer_select_code [1:0] ),
    .out( DigitToOutput0_if_code2NOT)
);

mux4b #(7) second_getAnswerDigitToOutput0(
    .in0( DigitToOutput0_if_code2NOT ),
    .in1( fullAnswer_Digit4 ),
    .sel( in_answer_select_code [2] ),
    .out( AnswerDigitToOutput0 )
);

//assign AnswerDigitToOutput1
mux4b #(7) first_getAnswerDigitToOutput1(
    .in0( fullAnswer_Digit1 ),
    .in1( fullAnswer_Digit2 ),
    .in2( fullAnswer_Digit3),
    .in3( fullAnswer_Digit4 ),
    .sel( in_answer_select_code [1:0] ),
    .out( DigitToOutput1_if_code2NOT)
);

mux4b #(7) second_getAnswerDigitToOutput1(
    .in0( DigitToOutput1_if_code2NOT ),
    .in1( fullAnswer_Digit5 ),
    .sel( in_answer_select_code [2] ),
    .out( AnswerDigitToOutput1 )
);

//assign AnswerDigitToOutput2
mux4b #(7) first_getAnswerDigitToOutput2(
    .in0( fullAnswer_Digit2 ),
    .in1( fullAnswer_Digit3 ),
    .in2( fullAnswer_Digit4),
    .in3( fullAnswer_Digit5 ),
    .sel( in_answer_select_code [1:0] ),
    .out( DigitToOutput2_if_code2NOT)
);

mux4b #(7) second_getAnswerDigitToOutput2(
    .in0( DigitToOutput2_if_code2NOT ),
    .in1( fullAnswer_Digit6 ),
    .sel( in_answer_select_code [2] ),
    .out( AnswerDigitToOutput2 )
);

//assign AnswerDigitToOutput3
mux4b #(7) first_getAnswerDigitToOutput3(
    .in0( fullAnswer_Digit3 ),
    .in1( fullAnswer_Digit4 ),
    .in2( fullAnswer_Digit5),
    .in3( fullAnswer_Digit6 ),
    .sel( in_answer_select_code [1:0] ),
    .out( DigitToOutput3_if_code2NOT)
);

mux4b #(7) second_getAnswerDigitToOutput3(
    .in0( DigitToOutput3_if_code2NOT ),
    .in1( fullAnswer_Digit7 ),
    .sel( in_answer_select_code [2] ),
    .out( AnswerDigitToOutput3 )
);

endmodule