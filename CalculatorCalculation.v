`timescale 1ns / 1ps

module CalculatorCalculation
(
	input [15:0] IN_num1, IN_num2,
    input [2:0] IN_operation_code,
	output [31:0] OUT_answer,
    output OUT_is_negative
);

wire [31:0] addition_answer, subtraction_answer, multiplication_answer;

Multiplier_16 multiply (
    .A_in16( IN_num1 ),
    .B_in16( IN_num2 ),
    .Product_out32 ( multiplication_answer )
);

Adder_16 add (
    .A_in16( IN_num1 ),
    .B_in16( IN_num2 ),
    .Carry_in( 1'b0 ),
    .Sum_out16( addition_answer[15:0] ),
    .Carry_out( addition_answer[16] ) //any extra carry is should be added to the end of the sum
);

Subtractor_16_with_negatives subtract (
    .A_in16( IN_num1 ),
    .B_in16( IN_num2 ),
    .Carry_in( 1'b0 ),
    .Diff_out16( subtraction_answer ),
    .Is_negative_out( OUT_is_negative )
);



///////////////////
// Get mux code  //
///////////////////
/*
IN_operation_code
[2]                  [1]                [0]                   mux_code
0                    0                  0                     00        no operation
1                    0                  0                     01        multiply
0                    1                  0                     10        subtract
0                    0                  1                     11        add
the IN_show inputs will never be in any other arrangement than these 4 above
*/

wire [1:0] mux_code;

or (mux_code[0], IN_operation_code[2], IN_operation_code[0]);
or (mux_code[1], IN_operation_code[1], IN_operation_code[0]);

mux4b #(32) get_answer_to_output (
    .in0( 32'b00000000_00000000_00000000_00000000 ),
    .in1( multiplication_answer ),
    .in2( subtraction_answer ),
    .in3( addition_answer ),
    
    .sel( mux_code ),
    .out( OUT_answer )
);

endmodule