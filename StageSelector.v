`timescale 1ns / 1ps

module StageSelector
(
	input previous_stage_button, next_stage_button, clk,
	output store_num1, store_num2, store_operation, display_16bit_switches, display_operation, display_32bit_answer
);

wire X3, X4, X28, X36, X37, X38, X39, X41, X50, X51, X67, X74, X80, X83, X84, X85, X86, X93, X97, X98, X104, X120;

//uses debounce on the button inputs
wire previous_stage, next_stage;

debouncer debouncer1(
    .clk(clk),
    .PB(previous_stage_button),
    .PB_up(previous_stage)
    );
    
debouncer debouncer2(
    .clk(clk),
    .PB(next_stage_button),
    .PB_up(next_stage)
    );
    

//2-bit register
dff U3 (
	.data_out(X3),
	.in_D( X41 ),
	.in_CLK( clk )
);

dff U4 (
	.data_out(X4),
	.in_D( X86 ),
	.in_CLK( clk )
);

//combinational controller logic from StageSelector logic designer
assign store_num2 = X3;

and U19 (store_operation,X3, X4);

not U23 (display_16bit_switches,X3);

and U26 (display_32bit_answer,X3, X4);

and U27 (display_operation,X3, X28);

not U28 (X28,X4);

and U36 (X36,X4, next_stage, X50, X51);

and U37 (X37,X3, X4, X67);

and U38 (X38,X3, previous_stage, next_stage);

and U39 (X39,X3, X74, X80);

or U41 (X41,X36, X37, X38, X39);

not U50 (X50,X3);

not U51 (X51,previous_stage);

not U67 (X67,next_stage);

not U74 (X74,X4);

not U80 (X80,previous_stage);

and U83 (X83,X4, X93);

and U84 (X84,next_stage, X97, X98);

and U85 (X85,X3, previous_stage, X104, X120);

or U86 (X86,X83, X84, X85);

xnor U93 (X93,previous_stage, next_stage);

not U97 (X97,X4);

not U98 (X98,previous_stage);

not U104 (X104,next_stage);

or U111 (store_num1,X3, X4);

not U120 (X120,X4);


endmodule