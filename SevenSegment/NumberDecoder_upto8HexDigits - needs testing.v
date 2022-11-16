`timescale 1ns / 1ps

module NumberDecoder_upto8HexDigits
(
	input [31:0] binary_number //could be the 16-bit num1, num2, or the 32-bit answer
	output [6:0] Hex_Digit0, Hex_Digit1, Hex_Digit2, Hex_Digit3,
	Hex_Digit4, Hex_Digit5, Hex_Digit6, Hex_Digit7
);

wire [6:0] raw_digit0, raw_digit1, raw_digit2, raw_digit3
raw_digit4, raw_digit5, raw_digit6, raw_digit7;


///////////////////////////////////////////////////////////////////////////////////////////
// Assigning the 8 binary_number raw_digits using the FourBit_ToHex module ////////////////
///////////////////////////////////////////////////////////////////////////////////////////

FourBit_ToHex get_digit0(
	.four_bit(binary_number[3:0]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit0 )
);

FourBit_ToHex get_digit1(
	.four_bit(binary_number[7:4]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit1 )
);

FourBit_ToHex get_digit2(
	.four_bit(binary_number[11:8]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit2 )
);

FourBit_ToHex get_digit3(
	.four_bit(binary_number[15:12]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit3 )
);

FourBit_ToHex get_digit4(
	.four_bit(binary_number[19:16]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit4 )
);

FourBit_ToHex get_digit5(
	.four_bit(binary_number[23:20]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit5 )
);

FourBit_ToHex get_digit6(
	.four_bit(binary_number[27:24]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit6 )
);

FourBit_ToHex get_digit7(
	.four_bit(binary_number[31:28]),
	.en( 1'b1 ),
	.Hex_Digit( Hex_Digit7 )
);
//////////////////////////////////////////////////////////////////////////////////////////////////////


wire [6:0] is_value_behind_digit;  /*not to be confused with a 7-bit digit bus for the 7 segment display
is_value_behind[6] is 1 when there is a nonzero value behind the 6th
digit and is 0 otherwise, same goes for [5], [4], [3], [2], [1], [0].

The purpose of is_value_behind is to determine if there are any
leading zeros that can be omitted from being displayed. */

///////////////////////////////////////////////////////////
// Calculating if there is a value behind each hex digit //
///////////////////////////////////////////////////////////

or (is_value_behind[6], binary_number[31], binary_number[30], binary_number[29], binary_number[28]);
//note: is_value_behind[6] will be 1 unless there is a 0 for each of the
//4 bits which correspond to digit 7

or (is_value_behind[5], is_value_behind[6], binary_number[27], binary_number[26], binary_number[25], binary_number[24]);
//note: is_value_behind[5] will be 1 unless there is a 0 for each of the
//4 bits which correspond to digit 6 aswell as no value behinds digit6

or (is_value_behind[4], is_value_behind[5], binary_number[23], binary_number[22], binary_number[21], binary_number[20]);
//note: is_value_behind[4] will be 1 unless there is a 0 for each of the
//4 bits which correspond to digit 5 aswell as no value behinds digit5

or (is_value_behind[3], is_value_behind[4], binary_number[19], binary_number[18], binary_number[17], binary_number[16]);
or (is_value_behind[2], is_value_behind[3], binary_number[15], binary_number[14], binary_number[13], binary_number[12]);
or (is_value_behind[1], is_value_behind[2], binary_number[11], binary_number[10], binary_number[9], binary_number[8]);
or (is_value_behind[0], is_value_behind[1], binary_number[7], binary_number[6], binary_number[5], binary_number[4]);

//we don't care if the value AT digit 0 is a zero, we still would want to show that to the user

wire not_is_value_behind[6:0];
not_8 Inverting_is_value_behind (not_is_value_behind, is_value_behind);


///////////////////////////////////////////////////////////////////////////////////////////
// Assigning the final 8 outputted Hex Digits /////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

//the digits of leading zeros will be set to all 1s, which results in clearing the 7-segment display

assign Hex_Digit0 = raw_digit0; //final digit 0 will match the raw_digit0

mux4b #(7) set_final_digit1 (
	.in0( raw_digit1 ),
	.in1( 7'b111_1111 ),
	.sel( is_value_behind[0] )
);

mux4b #(7) set_final_digit2 (
	.in0( raw_digit2 ),
	.in1( 7'b111_1111 ),
	.sel( is_value_behind[1] )
);

mux4b #(7) set_final_digit3 (
	.in0( raw_digit3 ),
	.in1( 7'b111_1111 ),
	.sel( is_value_behind[2] )
)

mux4b #(7) set_final_digit4 (
	.in0( raw_digit4 ),
	.in1( 7'b111_1111 ),
	.sel( is_value_behind[3] )
);

mux4b #(7) set_final_digit5 (
	.in0( raw_digit5 ),
	.in1( 7'b111_1111 ),
	.sel( is_value_behind[4] )
);

mux4b #(7) set_final_digit6 (
	.in0( raw_digit6 ),
	.in1( 7'b111_1111 ),
	.sel( is_value_behind[5] )
);

mux4b #(7) set_final_digit7 (
	.in0( raw_digit7 ),
	.in1( 7'b111_1111 ),
	.sel( is_value_behind[6] )
);

endmodule