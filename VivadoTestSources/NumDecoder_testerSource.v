`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 08:01:48 PM
// Design Name: 
// Module Name: Tester
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


module Tester(
    input [15:0]sw,
    input clk,
    output [6:0]seg, [3:0]an
    );
    

    // To test FourBit_ToHex module
    wire [6:0]hex0;
    wire [6:0]hex1;
    wire [6:0]hex2;
    wire [6:0]hex3;
    
    
    
    NumberDecoder_upto8HexDigits get_num1_segs(
        .binary_number( {sw,sw} ),
        .Hex_Digit4  (hex0),
        .Hex_Digit5  (hex1 ),
        .Hex_Digit6 (hex2),
        .Hex_Digit7  (hex3)
    );
    
   
    SevenSeg_4digitDriver SevenSeg_4digitDriver1(
    .clk(clk),
    .digit0( hex0 ), //what you want to be shown at each digit
    .digit1( hex1 ),
    .digit2( hex2 ),
    .digit3( hex3 ),
    
    .cathode( seg ), //segment signal sent to physical segment cathodes
    .an( an ) //anode signal sent to physical digit anodes
    
    
    );
    
 
endmodule
