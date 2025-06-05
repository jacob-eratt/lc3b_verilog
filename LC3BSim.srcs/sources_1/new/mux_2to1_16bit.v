`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2025 05:20:30 PM
// Design Name: 
// Module Name: mux_2to1_16bit
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


module mux_2to1_16bit(
    input [15:0] a,
    input [15:0] b,

    input s,
    output [15:0] out
    );
    
    genvar i;
    generate
        for(i = 0; i < 16; i = i+1) begin : mux_loop
            mux_2to1bit data_path_mux(a[i], b[i], s, out[i]);
          end
    endgenerate
endmodule
