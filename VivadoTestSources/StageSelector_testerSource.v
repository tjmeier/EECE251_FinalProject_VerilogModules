`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 01:27:42 PM
// Design Name: 
// Module Name: tester
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


module tester(
    input btnL, btnR, clk,
    output led1, led2, led3, led4, led5, led6
    );
    
StageSelector stageselector1(
    .previous_stage_button(btnL),
    .next_stage_button(btnR),
    .clk(clk),
    
    .store_num1(led1),
    .store_num2(led2),
    .store_operation(led3),
    .display_16bit_switches(led4),
    .display_operation(led5),
    .display_32bit_answer(led6)
);
    
endmodule
