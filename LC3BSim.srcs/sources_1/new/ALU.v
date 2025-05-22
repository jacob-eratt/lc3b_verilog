`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2025 05:48:56 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [1:0]ALUK,
    input [15:0] alu_a,
    input [15:0] alu_b,
    output [15:0] alu_out
    );
    
    wire [15:0] add_out;
    wire [15:0] xor_out;
    wire [15:0] passA_out;
    wire [15:0] and_out;
    
    adder kogge_stone(add_out, alu_a, alu_b);
    assign xor_out = alu_a ^ alu_b;
    assign passA_out = alu_a;
    assign and_out = alu_a & alu_b;
    
    mux_4to1_16bit alu_sel(
    .a(add_out),
    .b(and_out),
    .c(xor_out),
    .d(passA_out),
    .s(ALUK),
    .out(alu_out)
    );
    
   initial begin
        $monitor("add = %h | xor_out = %h | passA = %h |and_out = %h | alu_out = %h", add_out, xor_out, passA_out, and_out, alu_out);
    end
    
endmodule
