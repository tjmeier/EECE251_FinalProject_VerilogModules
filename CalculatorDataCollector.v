`timescale 1ns / 1ps

module CalculatorDataCollector
(
	input [15:0] IN_switches,
    input [2:0] IN_operation_code,
    //input IN_clk,

    input IN_store_num1, IN_store_num2, IN_store_operation_code,
    //from Stage Selector module
    
    output [15:0] OUT_num1, OUT_num2,
    output [2:0] OUT_operation_code
);


//16-bit register to store IN_switches to OUT_num1
//occurs on rising edge of deb_store_num1
dff_16 num1 (
    .d_16(IN_switches),
    .clk_in( IN_store_num1 ),
    .q_16(OUT_num1)
);

//16-bit register to store IN_switches to OUT_num2
//occurs on rising edge of deb_store_num2
dff_16 num2 (
    .d_16(IN_switches),
    .clk_in( IN_store_num2 ),
    .q_16(OUT_num2)
);

//3-bit register to store IN_operation_code to OUT_operation_code
//occurs on rising edge of deb_store_operation_code
dff opcode0 (
	.data_out( OUT_operation_code[0] ),
	.in_D( IN_operation_code[0] ),
	.in_CLK( IN_store_operation_code )
);

dff opcode1 (
	.data_out( OUT_operation_code[1] ),
	.in_D( IN_operation_code[1] ),
	.in_CLK( IN_store_operation_code )
);

dff opcode2 (
	.data_out( OUT_operation_code[2] ),
	.in_D( IN_operation_code[2] ),
	.in_CLK( IN_store_operation_code )
);

endmodule