`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 02:57:00 PM
// Design Name: 
// Module Name: Shf
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


module shf(
    input signed [15:0] sr1,
    input [5:0] ir_signal,
    output [15:0] shf_out
    );
    wire [1:0] sel;
    wire [3:0] amt;
    
    wire [15:0] lshf;
    wire [15:0] rshfl;
    wire [15:0] rshfa;
    
    assign sel = ir_signal>>4;
    assign amt = ir_signal & 16'h000F;
    
    assign lshf = sr1<<amt;
    assign rshfl = sr1 >> amt;
    assign rshfa = sr1 >>>amt;
    
    mux_4to1_16bit shf_sel(
        .a(lshf),
        .b(rshfl),
        .c(lshf),
        .d(rshfa),
        .s(sel),
        .out(shf_out)
    );
    
endmodule
