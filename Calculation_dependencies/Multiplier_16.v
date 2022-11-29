`timescale 1ns / 1ps

module Multiplier_16
(
	input [15:0] A_in16, B_in16, 
	output [31:0] Product_out32
);

wire [31:0] addend0, addend1, addend2, addend3, addend4,
addend5, addend6, addend7, addend8, addend9,
addend10, addend11, addend12, addend13, addend14, addend15;

wire [31:0] total0, total1, total2, total3, total4, total5,
total6, total7, total8, total9, total10, total11, total12, total13;

//when the B bit is 1, the A_in16 will be mapped to the X values,
//otherwise, the whole addennd will remain 0

//addend0
//00000000_00000000_XXXXXXXX_XXXXXXXX
mux4b #(8) addend0part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[0]),
    .out( addend0[7:0] )
);
mux4b #(8) addend0part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[0]),
    .out( addend0[15:8] ) 
);

//addend1
//00000000_0000000X_XXXXXXXX_XXXXXXX0
mux4b #(8) addend1part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[1]),
    .out( addend1[8:1] )
);
mux4b #(8) addend1part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[1]),
    .out( addend1[16:9] )
);

//addend2
//00000000_000000XX_XXXXXXXX_XXXXXX00
mux4b #(8) addend2part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[2]),
    .out( addend2[9:2] )
);
mux4b #(8) addend2part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[2]),
    .out( addend2[17:10] )
);

//addend3
//00000000_00000XXX_XXXXXXXX_XXXXX000
mux4b #(8) addend3part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[3]),
    .out( addend3[10:3] )
);
mux4b #(8) addend3part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[3]),
    .out( addend3[18:11] )
);

//addend4
//00000000_0000XXXX_XXXXXXXX_XXXX0000
mux4b #(8) addend4part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[4]),
    .out( addend4[11:4] )
);
mux4b #(8) addend4part2(
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[4]),
    .out( addend4[19:12] )
);

//addend5
//00000000_000XXXXX_XXXXXXXX_XXX00000
mux4b #(8) addend5part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[5]),
    .out( addend5[12:5] )
);
mux4b #(8) addend5part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[5]),
    .out( addend5[20:13] )
);

//addend6
//00000000_00XXXXXX_XXXXXXXX_XX000000
mux4b #(8) addend6part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[6]),
    .out( addend6[13:6] )
);
mux4b #(8) addend6part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[6]),
    .out( addend6[21:14] )
);

//addend7
//00000000_0XXXXXXX_XXXXXXXX_X0000000
mux4b #(8) addend7part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[7]),
    .out( addend7[14:7] )
);
mux4b #(8) addend7part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[7]),
    .out( addend7[22:15] )
);

//addend8
//00000000_XXXXXXXX_XXXXXXXX_00000000
mux4b #(8) addend8part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[8]),
    .out( addend8[15:8] )
);
mux4b #(8) addend8part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[8]),
    .out( addend8[23:16] )
);

//addend9
//0000000X_XXXXXXXX_XXXXXXX0_00000000
mux4b #(8) addend9part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[9]),
    .out( addend9[16:9] )
);
mux4b #(8) addend9part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[9]),
    .out( addend9[24:17] )
);

//addend10
//000000XX_XXXXXXXX_XXXXXX00_00000000
mux4b #(8) addend10part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[10]),
    .out( addend10[17:10] )
);
mux4b #(8) addend10part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[10]),
    .out( addend10[25:18] )
);

//addend11
//00000XXX_XXXXXXXX_XXXXX000_00000000
mux4b #(8) addend11part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[11] ),
    .out( addend11[18:11] )
);
mux4b #(8) addend11part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[11]),
    .out( addend11[26:19] )
);

//addend12
//0000XXXX_XXXXXXXX_XXXX0000_00000000
mux4b #(8) addend12part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[12] ),
    .out( addend12[19:12] )
);
mux4b #(8) addend12part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[12]),
    .out( addend12[27:20] )
);

//addend13
//000XXXXX_XXXXXXXX_XXX00000_00000000
mux4b #(8) addend13part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[13] ),
    .out( addend13[20:13] )
);
mux4b #(8) addend13part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[13]),
    .out( addend13[28:21] )
);

//addend14
//00XXXXXX_XXXXXXXX_XX000000_00000000
mux4b #(8) addend14part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[14] ),
    .out( addend14[21:14] )
);
mux4b #(8) addend14part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[14]),
    .out( addend14[29:22] )
);

//addend15
//0XXXXXXX_XXXXXXXX_X0000000_00000000
mux4b #(8) addend15part1 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[7:0]),

    .sel( B_in16[15] ),
    .out( addend15[22:15] )
);
mux4b #(8) addend15part2 (
    .in0( 8'b0000_0000 ),
    .in1( A_in16[15:8]),

    .sel( B_in16[15]),
    .out( addend15[30:23] )
);

///////////////////////////////////////////////////////////
//// Adding together the 16 addends to get the product ////
///////////////////////////////////////////////////////////

Adder_32 addend0_plus_addend1 (
	.A_in32( addend0 ),
	.B_in32( addend1 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total0 )
);

Adder_32 addend2_plus_addend3 (
	.A_in32( addend2 ),
	.B_in32( addend3 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total1 )
);

Adder_32 addend4_plus_addend5 (
	.A_in32( addend4 ),
	.B_in32( addend5 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total2 )
);
Adder_32 addend6_plus_addend7 (
	.A_in32( addend6 ),
	.B_in32( addend7 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total3 )
);

Adder_32 addend8_plus_addend9 (
	.A_in32( addend8 ),
	.B_in32( addend9 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total4 )
);

Adder_32 addend10_plus_addend11 (
	.A_in32( addend10 ),
	.B_in32( addend11 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total5 )
);

Adder_32 addend12_plus_addend13 (
	.A_in32( addend12 ),
	.B_in32( addend13 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total6 )
);

Adder_32 addend14_plus_addend15 (
	.A_in32( addend14 ),
	.B_in32( addend15 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total7 )
);

//second order adds

Adder_32 total0_plus_total1 (
	.A_in32( total0 ),
	.B_in32( total1 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total8 )
);

Adder_32 total2_plus_total3 (
	.A_in32( total2 ),
	.B_in32( total3 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total9 )
);

Adder_32 total4_plus_total5 (
	.A_in32( total4 ),
	.B_in32( total5 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total10 )
);

Adder_32 total6_plus_total7 (
	.A_in32( total6 ),
	.B_in32( total7 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total11 )
);

//third order adds

Adder_32 total8_plus_total9 (
	.A_in32( total8 ),
	.B_in32( total9 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total12 )
);

Adder_32 total10_plus_total11 (
	.A_in32( total10 ),
	.B_in32( total11 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( total13 )
);

//getting the final product

Adder_32 total12_plus_total13 (
	.A_in32( total12 ),
	.B_in32( total13 ),
	.Carry_in( 1'b0 ),
	
	.Sum_out32( Product_out32 )
);

endmodule