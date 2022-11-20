`timescale 1ns / 1ps 

module CalculatorSevenSegDisplay(
    input [15:0] IN_switches, //comes directly from the board switches
    input [2:0] IN_operation_code,
    input [31:0] IN_answer, //from calculations module
    input IN_show_16bit_input, IN_show_operation, IN_show_answer, //from Stage Selector module
    input IN_up_button, IN_down_button, IN_center_button, IN_clk, //from board buttons and clock

    output [7:0] OUT_Led_Visualizer_answer, //goes directly to board LEDs
    output [6:0] OUT_cathode, [3:0] OUT_anode //goes directly to board seven segment display

    );

    //////////////////////////////////////////
    // Get Seven Seg Output for IN_switches //
    //////////////////////////////////////////

    wire [6:0]switches_hex0, switches_hex1, switches_hex2, switches_hex3;
    
    NumberDecoder_upto8HexDigits get_switches_segs(
        .binary_number ( IN_switches ),
        .Hex_Digit0 (switches_hex0),
        .Hex_Digit1 (switches_hex1),
        .Hex_Digit2 (switches_hex2),
        .Hex_Digit3 (switches_hex3)
    );

    ////////////////////////////////////////////////
    // Get Seven Seg Output for IN_operation_code //
    ////////////////////////////////////////////////

    wire [6:0]op_letter0, op_letter1, op_letter2, op_letter3;

    OperationDecoder get_operation_segs(
        .operation( IN_operation_code ),
        .opletter0( op_letter0 ),
        .opletter1( op_letter1 ),
        .opletter2( op_letter2 ),
        .opletter3( op_letter3 )
    );

    //////////////////////////////////////////
    // Get Seven Seg Output for IN_switches //
    //////////////////////////////////////////
    
    wire [6:0] answer_hex0, answer_hex1, answer_hex2, answer_hex3;
    wire [7:0] Led_Visualizer_answer;
    
    AnswerDecoder get_answer_segs(
        .IN_binary_answer( IN_answer ),
        .IN_up_button( IN_up_button ),
        .IN_down_button( IN_down_button ),
        .IN_center_button( IN_center_button ),
        .IN_clk( IN_clk ),

        .OUT_Led_Visualizer( Led_Visualizer_answer ),
        .OUT_AnswerDigit0( answer_hex0 ),
        .OUT_AnswerDigit1( answer_hex1 ),
        .OUT_AnswerDigit2( answer_hex2 ),
        .OUT_AnswerDigit3( answer_hex3 )
    );

    mux4b #(8) set_OUT_Led_Visualizer_Answer (
	.in1( Led_Visualizer_answer ),
	.in0( 8'b0000_0000 ), //we want all the visualizer LEDs to be off when answer is not shown
	.sel( IN_show_answer ),
	.out ( OUT_Led_Visualizer_answer )
    );

    ////////////////////////////////////////////////////////////////////////////////////
    // Choose which Seven Seg Output is sent to the board //////////////////////////////
    // depends on the IN_show inputs                      //////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////

    ///////////////////
    // Get show_code //
    ///////////////////
    /*
    IN_show_16bit_input, IN_show_operation, IN_show_answer        show_code
    0                    0                  0                     00
    1                    0                  0                     01
    0                    1                  0                     10
    0                    0                  1                     11

    the IN_show inputs will never be in any other arrangement than these 4 above
    */

    wire [1:0] show_code;

    or (show_code[0], IN_show_16bit_input, IN_show_answer);
    or (show_code[1], IN_show_operation, IN_show_answer);

    ////////////////////////////////////
    // Assign the final output digits //
    ////////////////////////////////////
    
    wire [6:0] final_digit0, final_digit1, final_digit2, final_digit3;

    mux4b #(7) set_final_digit0 (
        .in0( 7'b0000_001 ), //if no IN_show are being received, displays dashes to each digit
        .in1( switches_hex0 ),
        .in2( op_letter0 ),
        .in3( answer_hex0 ),
        .sel( show_code ),
        .out ( final_digit0 )
    );

    mux4b #(7) set_final_digit1 (
        .in0( 7'b0000_001 ), //if no IN_show are being received, displays dashes to each digit
        .in1( switches_hex1 ),
        .in2( op_letter1 ),
        .in3( answer_hex1 ),
        .sel( show_code ),
        .out ( final_digit1 )
    );

    mux4b #(7) set_final_digit2 (
        .in0( 7'b0000_001 ), //if no IN_show are being received, displays dashes to each digit
        .in1( switches_hex2 ),
        .in2( op_letter2 ),
        .in3( answer_hex2 ),
        .sel( show_code ),
        .out ( final_digit2 )
    );

    mux4b #(7) set_final_digit3 (
        .in0( 7'b0000_001 ), //if no IN_show are being received, displays dashes to each digit
        .in1( switches_hex3 ),
        .in2( op_letter3 ),
        .in3( answer_hex3 ),
        .sel( show_code ),
        .out ( final_digit3 )
    );

    ///////////////////////////////////////
    // Send final digits to be displayed //
    ///////////////////////////////////////

    SevenSeg_4digitDriver set_cathode_anode(
        .clk(IN_clk),
        .digit0( final_digit0 ),
        .digit1( final_digit1 ),
        .digit2( final_digit2 ),
        .digit3( final_digit3 ),
        
        .cathode( OUT_cathode ), //segment signal sent to physical segment cathodes
        .an( OUT_anode ) //anode signal sent to physical digit anodes
    );


endmodule