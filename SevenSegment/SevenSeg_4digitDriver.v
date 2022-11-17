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

///////////////////////////////////////////////////////////
////Get anode_clk to be used as mux selects////////////////
///////////////////////////////////////////////////////////

wire anode_clk0, anode_clk1;

anode_clock anode_clock1(
	.clk(clk),
	.anode_clk0 ( anode_clk0 ),
	.anode_clk1 ( anode_clk1 )  //2 bit cycling bus, updates every ~2.6 miliseconds
	//this delay is required for refresh period of the 7 segment display
);

///////////////////////////////////////////////////////////
//// anode activation /////////////////////////////////////
///////////////////////////////////////////////////////////

/*
//when an anode[x] = 0,  digit x is on
//when an anode[x] = 1,  digit x is off

in					out
anode_clk[1:0]		anode[3:0]
0					1110
1					1101
2					1011
3					0111

*/

//setting inverted anode clocks
wire not_anode_clk0, not_anode_clk1;
not NOT0(not_anode_clk0, anode_clk0);
not NOT1(not_anode_clk1, anode_clk1);

//Uses anode clock data to cycle through the anode states
or OR00(anode[0], anode_clk0, anode_clk1);
nand NAND1(anode[1], anode_clk0, not_anode_clk1);
nand NAND2(anode[2], not_anode_clk0, anode_clk1);
nand NAND3(anode[3], anode_clk0, anode_clk1);

///////////////////////////////////////////////////////////
//// cathode activation ///////////////////////////////////
///////////////////////////////////////////////////////////

//the mux chooses which digit to send to the cathode[6:0] to correspond with which anode is active
mux4b #(7) cathode_select (
	.in0( digit0 ),
	.in1( digit1 ),
	.in2( digit2 ),
	.in3( digit3 ),
	.sel( {anode_clk1, anode_clk0} ),
	.out( cathode )
);

endmodule