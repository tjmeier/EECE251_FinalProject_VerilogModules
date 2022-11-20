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
    
    wire [6:0]letter0;
    wire [6:0]letter1;
    wire [6:0]letter2;
    wire [6:0]letter3;
    
    // To test FourBit_ToHex module
    wire [6:0]hex0;
    wire [6:0]hex1;
    wire [6:0]hex2;
    wire [6:0]hex3;
    
    FourBit_ToHex sethex0(
        .four_bit(sw[3:0]),
        .en( 1'b1 ),
        .Hex_Digit( hex0 )
    );
    
    FourBit_ToHex sethex1(
        .four_bit(sw[7:4]),
        .en( 1'b1 ),
        .Hex_Digit( hex1 )
    );
    
    FourBit_ToHex sethex2(
        .four_bit(sw[11:8]),
        .en( 1'b1 ),
        .Hex_Digit( hex2 )
    );
    
    FourBit_ToHex sethex3(
        .four_bit(sw[15:12]),
        .en( 1'b1 ),
        .Hex_Digit( hex3 )
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
    
    /*
    OperationDecoder OperationDecoder1(
        .operation(sw[2:0]),
        .opletter0( letter0 ),
        .opletter1( letter1 ),
        .opletter2( letter2 ),
        .opletter3( letter3 )
    );
    
    
    SevenSeg_4digitDriver SevenSeg_4digitDriver1(
    .clk(clk),
    .digit0( letter0 ), //what you want to be shown at each digit
    .digit1( letter1 ),
    .digit2( letter2 ),
    .digit3( letter3 ),
    
    .cathode( seg ), //segment signal sent to physical segment cathodes
    .an( an ) //anode signal sent to physical digit anodes
    
    
    );
    */
endmodule
