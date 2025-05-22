`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 09:23:21 PM
// Design Name: 
// Module Name: mux_2to1_3bit
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


module mux_2to1bit(input a, input b, input s, output result);
    //a: 0
    //b: 1
    wire not_s;
    wire andA, andB;
    not (not_s, s);
    
    and (andA, a, not_s);
    and (andB, b, s);
    
    or (result, andA, andB);
        

endmodule
