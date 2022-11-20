`timescale 1ns / 1ps 

module AnswerSelector_FullTestSource(
    input btnU, btnD, btnC, clk,
    output [7:0]led,
    output [6:0]seg, [3:0]an
    );
    
    wire [6:0]outhex0, outhex1, outhex2, outhex3;
    
    AnswerDecoder AnswerDecoder1(
        .IN_binary_answer( 32'b0000_0000_1100_1001_1100_0010_0100_1110 ),
        .IN_up_button(btnU),
        .IN_down_button(btnD),
        .IN_center_button(btnC),
        .IN_clk( clk ),
        .OUT_Led_Visualizer( led ),
        .OUT_AnswerDigit0( outhex0 ),
        .OUT_AnswerDigit1( outhex1 ),
        .OUT_AnswerDigit2( outhex2 ),
        .OUT_AnswerDigit3( outhex3 )
    );
    

    SevenSeg_4digitDriver SevenSeg_4digitDriver1(
        .clk(clk),
        .digit0( outhex0 ), //what you want to be shown at each digit
        .digit1( outhex1 ),
        .digit2( outhex2 ),
        .digit3( outhex3 ),
        
        .cathode( seg ), //segment signal sent to physical segment cathodes
        .an( an ) //anode signal sent to physical digit anodes
    );


endmodule
