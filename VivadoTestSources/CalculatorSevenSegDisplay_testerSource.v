`timescale 1ns / 1ps 

module AnswerSelector_FullTestSource(
    input btnU, btnD, btnC, btnL, btnR, clk,
    input [15:0] sw,
    output [15:0]led,
    output [6:0]seg, [3:0]an
    );
    
    wire display_sw, display_op, display_answer;
    
    CalculatorSevenSegDisplay (
        .IN_switches( sw ),
        .IN_operation_code( sw[2:0] ),
        .IN_answer( 32'b1111001100110001_1100110000001111 ),
        
        .IN_show_16bit_input( display_sw ),
        .IN_show_operation (display_op),
        .IN_show_answer (display_answer),
        
        .IN_up_button( btnU ),
        .IN_down_button( btnD ),
        .IN_center_button( btnC ),
        .IN_clk( clk ),
        
        .OUT_Led_Visualizer_answer( led[7:0] ),
        .OUT_cathode( seg ),
        .OUT_anode( an )
    );
    
    CalculatorStageSelector (
        .previous_stage_button(btnL),
        .next_stage_button(btnR),
        .clk(clk),
        
        .store_num1(led[15]),
        .store_num2(led[14]),
        .store_operation(led[13]),
        .display_16bit_switches( display_sw ),
        .display_operation( display_op ),
        .display_32bit_answer( display_answer )
    );
    
     
endmodule