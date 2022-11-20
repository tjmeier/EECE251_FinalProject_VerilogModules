`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2022 09:54:26 PM
// Design Name: 
// Module Name: AS_gC_tester
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AS_gC_tester(
    input btnU, btnD, btnC, clk,
    output [7:0]led
    );
    
    wire [2:0] code;
    
    AnswerSelector_getCode (
        .clk ( clk ),
        .up_button( btnU ),
        .down_button( btnD ),
        .center_button( btnC ),
        .out_answer_select_code( code )
    );
    
    AnswerSelector_LEDvisualizer (
        .in_answer_select_code( code ),
        .out_LED( led )
    );
endmodule
