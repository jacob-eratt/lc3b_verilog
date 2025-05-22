`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 01:08:25 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
 // Inputs
    reg [1:0] ALUK;
    reg [15:0] alu_a;
    reg [15:0] alu_b;

    // Output
    wire [15:0] alu_result;

    // Instantiate the ALU
    ALU uut (
        .ALUK(ALUK),
        .alu_a(alu_a),
        .alu_b(alu_b),
        .alu_out(alu_result)
    );

    initial begin
        // Monitor values
        $monitor("ALUK = %b | A = %h | B = %h | Result = %h", ALUK, alu_a, alu_b, alu_result);

        // Test ADD (ALUK = 000)
        ALUK = 2'b00; alu_a = 16'h0003; alu_b = 16'h0005; #10;

        // Test AND (ALUK = 001)
        ALUK = 2'b01; alu_a = 16'h00FF; alu_b = 16'h0F0F; #10;

        // Test XOR (ALUK = 010)
        ALUK = 2'b10; alu_a = 16'hAAAA; alu_b = 16'h5555; #10;

        // Test PASS A (ALUK = 011)
        ALUK = 2'b11; alu_a = 16'hABCD; alu_b = 16'h1234; #10;

        $finish;
    end
   
endmodule
