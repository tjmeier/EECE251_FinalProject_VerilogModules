`timescale 1ns / 1ps

module SevenSeg_4digitDriver
(
	input clk,
	input [6:0]digit0, [6:0]digit1, [6:0]digit2, [6:0]digit3,
	
	output [6:0]cathode,
	output [3:0]an
);

wire [3:0]anode;
assign an = anode;


//Gets anode clock data
wire anode_clk0, anode_clk1;
wire next_clk0, next_clk1;
wire not_anode_clk0, not_anode_clk1;

anode_clock anode_clock1(
	.clk(clk),
	.anode_clk0 ( anode_clk0 ),
	.anode_clk1 ( anode_clk1 )  //2 bit bus cycles 00 > 01 > 10 > 11 > 00 every ~2.6 miliseconds
	//this delay is required for refresh period of the 7 segment display
);



/*
//2 bit cycler logic to set anode clock data (does not work, the 10ns clock is way too fast)
dff clk0 (
	.data_out( anode_clk0 ),
	.in_D( next_clk0 ),
	.in_CLK( clk )
	
);

dff clk1 (
	.data_out( anode_clk1 ),
	.in_D( next_clk1 ),
	.in_CLK( clk )
);

not NOTclk0(next_clk0, anode_clk0);
xor XORclk1(next_clk1, anode_clk0, anode_clk1);
*/




//setting inverted anode clocks
not NOT0(not_anode_clk0, anode_clk0);
not NOT1(not_anode_clk1, anode_clk1);


//Uses anode clock data to cycle through the anode states
or OR00(anode[0], anode_clk0, anode_clk1);
nand NAND1(anode[1], anode_clk0, not_anode_clk1);
nand NAND2(anode[2], not_anode_clk0, anode_clk1);
nand NAND3(anode[3], anode_clk0, anode_clk1);


//when an anode = 0, the digit is on
//when an anode = 1, the digit is off

//when a cathode = 0, the segment is on
//when a cathode = 1, the segment is off


//below is the logic to make the cathode assigned to the correct digit at the corrent anode timing
//masks will be all 0 if it's corresponding anode is 1 (and thus inneffectual in the OR final cath output)
//masks will be the corresponding digit if the anode is 0 (and thus will become the OR final cath output)

wire [6:0]mask0;
wire [6:0]mask1;
wire [6:0]mask2;
wire [6:0]mask3;
wire [3:0]inverse_anode;

not NOT00(inverse_anode[0], anode[0]);
not NOT01(inverse_anode[1], anode[1]);
not NOT02(inverse_anode[2], anode[2]);
not NOT03(inverse_anode[3], anode[3]);

//digit 0 mask
and AND0(mask0[0], inverse_anode[0], digit0[0]);
and AND1(mask0[1], inverse_anode[0], digit0[1]);
and AND2(mask0[2], inverse_anode[0], digit0[2]);
and AND3(mask0[3], inverse_anode[0], digit0[3]);
and AND4(mask0[4], inverse_anode[0], digit0[4]);
and AND5(mask0[5], inverse_anode[0], digit0[5]);
and AND6(mask0[6], inverse_anode[0], digit0[6]);

//digit 1 mask
and AND7(mask1[0], inverse_anode[1], digit1[0]);
and AND8(mask1[1], inverse_anode[1], digit1[1]);
and AND9(mask1[2], inverse_anode[1], digit1[2]);
and AND10(mask1[3], inverse_anode[1], digit1[3]);
and AND11(mask1[4], inverse_anode[1], digit1[4]);
and AND12(mask1[5], inverse_anode[1], digit1[5]);
and AND13(mask1[6], inverse_anode[1], digit1[6]);

//digit 2 mask
and AND14(mask2[0], inverse_anode[2], digit2[0]);
and AND15(mask2[1], inverse_anode[2], digit2[1]);
and AND16(mask2[2], inverse_anode[2], digit2[2]);
and AND17(mask2[3], inverse_anode[2], digit2[3]);
and AND18(mask2[4], inverse_anode[2], digit2[4]);
and AND19(mask2[5], inverse_anode[2], digit2[5]);
and AND20(mask2[6], inverse_anode[2], digit2[6]);

//digit 3 mask
and AND21(mask3[0], inverse_anode[3], digit3[0]);
and AND22(mask3[1], inverse_anode[3], digit3[1]);
and AND23(mask3[2], inverse_anode[3], digit3[2]);
and AND24(mask3[3], inverse_anode[3], digit3[3]);
and AND25(mask3[4], inverse_anode[3], digit3[4]);
and AND26(mask3[5], inverse_anode[3], digit3[5]);
and AND27(mask3[6], inverse_anode[3], digit3[6]);


//final cathode output (one mask will have the correct digit data, the other masks will be 0)
or OR0(cathode[0], mask0[0], mask1[0], mask2[0], mask3[0]);
or OR1(cathode[1], mask0[1], mask1[1], mask2[1], mask3[1]);
or OR2(cathode[2], mask0[2], mask1[2], mask2[2], mask3[2]);
or OR3(cathode[3], mask0[3], mask1[3], mask2[3], mask3[3]);
or OR4(cathode[4], mask0[4], mask1[4], mask2[4], mask3[4]);
or OR5(cathode[5], mask0[5], mask1[5], mask2[5], mask3[5]);
or OR6(cathode[6], mask0[6], mask1[6], mask2[6], mask3[6]);

endmodule