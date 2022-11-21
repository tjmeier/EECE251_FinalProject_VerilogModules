`timescale 1ns / 1ps 

module Calculator_noCalculations_testerSource(
    input btnU, btnD, btnC, btnL, btnR, clk,
    input [15:0] sw,
    output [15:0]led,
    output [6:0]seg, [3:0]an
    );
    
    wire display_sw, display_op, display_answer;
    wire [15:0]num1, num2;
    wire[2:0]opcode;
    wire store_num1, store_num2, store_opcode;
    
    CalculatorSevenSegDisplay (
        .IN_switches( sw ),
        .IN_operation_code( sw[2:0] ),
        .IN_answer( {num1, num2} ),
        
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
        
        .store_num1(store_num1 ),
        .store_num2(store_num2 ),
        .store_operation(store_opcode),
        .display_16bit_switches( display_sw ),
        .display_operation( display_op ),
        .display_32bit_answer( display_answer )
    );
    
    CalculatorDataCollector (
        .IN_switches( sw ),
        .IN_operation_code( sw[2:0] ),
        .IN_store_num1(store_num1),
        .IN_store_num2(store_num2),
        .IN_store_operation_code(store_opcode),
        
        .OUT_num1(num1),
        .OUT_num2(num2),
        .OUT_operation_code(opcode)
    );
    
    assign led[15] = store_num1;
    assign led[14] = store_num2;
    assign led[13] = store_opcode;
    
    assign led[11] = opcode[2];
    assign led[10] = opcode[1];
    assign led[9] = opcode[0];
endmodule
