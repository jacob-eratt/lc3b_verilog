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


module mux_2to1bit(output result, input s, input a, input b);
    //a: 0
    //b: 1
    wire not_s;
    wire andA, andB;
    not (not_s, s);
    
    and (andA, a, s);
    and (andB, b, not_s);
    
    or (result, andA, andB);
        

endmodule
