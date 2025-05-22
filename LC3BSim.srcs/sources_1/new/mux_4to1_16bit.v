`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 12:27:27 PM
// Design Name: 
// Module Name: mux_4to1_16bit
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


module mux_4to1_16bit(
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [1:0] s,
    output [15:0] out
    );
    
    genvar i;
    generate
        for(i = 0; i < 16; i = i+1) begin : mux_loop
            mux_4to1bit ALU_op_sel(out[i],s, a[i], b[i], c[i], d[i]);
          end
    endgenerate
        
    
    
endmodule
