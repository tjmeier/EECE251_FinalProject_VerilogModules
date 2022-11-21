`timescale 1ns / 1ps 

module AnswerDecoder( 
    input [31:0] IN_binary_answer, //takes in the 32-bit answer from the Calculator
    input IN_up_button, IN_down_button, IN_center_button, IN_clk,
    output [7:0]OUT_Led_Visualizer,
    output [6:0]OUT_AnswerDigit0, OUT_AnswerDigit1, OUT_AnswerDigit2, OUT_AnswerDigit3
    //outputs the 4 digits to be shown on the seven segment display
    );

    wire [6:0]hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7, outhex0, outhex1, outhex2, outhex3;
    //wires to transfer seven segment display hex values across modules
        
    NumberDecoder_upto8HexDigits get_num1_segs(
        .binary_number( IN_binary_answer ),
        .Hex_Digit0  (hex0),
        .Hex_Digit1  (hex1),
        .Hex_Digit2  (hex2),
        .Hex_Digit3  (hex3),
        .Hex_Digit4  (hex4),
        .Hex_Digit5  (hex5),
        .Hex_Digit6  (hex6),
        .Hex_Digit7  (hex7)
    );
        
    wire [2:0] answer_select_code; //wire used to take the answer_select_code from the getCode module
    //and deliver it to the LEDvisualizer and the 4digitsToOutput
    
    AnswerSelector_getCode (
        .clk ( IN_clk ),
        .up_button( IN_up_button ),
        .down_button( IN_down_button ),
        .center_button( IN_center_button ),
        .out_answer_select_code( answer_select_code )
    );
    
    AnswerSelector_LEDvisualizer (
        .in_answer_select_code( answer_select_code ),
        .out_LED( OUT_Led_Visualizer )
    );



    AnswerSelector_4digitsToOutput(
        hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7, //takes in the 8 hex digits
        answer_select_code, //takes in the answer_select_code
        OUT_AnswerDigit0, OUT_AnswerDigit1, OUT_AnswerDigit2, OUT_AnswerDigit3
        //outputs the final answer digits to be displayed
    );

endmodule