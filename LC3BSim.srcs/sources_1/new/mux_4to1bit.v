`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 11:48:53 AM
// Design Name: 
// Module Name: mux_4to1bit
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


module mux_4to1bit(output result, input [1:0] s, input a, input b, input c, input d );
    //a: 00
    //b: 01
    //c: 10
    //d: 11
    wire nots1;
    wire nots0;
    wire andA, andB, andC, andD;
    not (nots1, s[1]);
    not (nots0, s[0]);
    
    and (andA, a, nots1, nots0);
    and (andB, b, nots1, s[0]);
    and (andC, c, s[1], nots0);
    and (andD, d, s[1], s[0]);
    
    or (result, andA, andB, andC, andD);
    
    
endmodule
