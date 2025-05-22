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


module mux_2to1_3bit(
    input [2:0] a,
    input [2:0] b,

    input s,
    output [2:0] out
    );
    
    genvar i;
    generate
        for(i = 0; i < 3; i = i+1) begin : mux_loop
            mux_2to1bit data_path_mux(out[i],s, a[i], b[i]);
          end
    endgenerate
endmodule
