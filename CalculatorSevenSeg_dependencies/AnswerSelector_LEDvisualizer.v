`timescale 1ns / 1ps

module AnswerSelector_LEDvisualizer
(
	input [2:0]in_answer_select_code,
	output [7:0]out_LED //outputs an answer_code to navigate which group of 4 digits is selected to be outputed
);

    //Since there are 5 possible answer select codes, we will need 2 4b muxes
    wire [7:0] led_if_code2NOT;
    
    mux4b #(8) led_active_digits_display1(
        .in0( 8'b00001111 ),
        .in1( 8'b00011110 ),
        .in2( 8'b00111100 ),
        .in3( 8'b01111000 ),
        .sel( in_answer_select_code [1:0] ),
        .out( led_if_code2NOT )
    );
    
    mux4b #(8) led_active_digits_display2(
        .in0( led_if_code2NOT ),
        .in1( 8'b11110000 ),
        .sel( in_answer_select_code [2] ),
        .out( out_LED ) //outputed to led on the board
    );

endmodule 