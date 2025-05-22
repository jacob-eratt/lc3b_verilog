`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2025 03:40:13 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;

    // Inputs
    reg [15:0] a;
    reg [15:0] b;

    // Output
    wire [15:0] result;

    // Instantiate the adder
    adder uut (
        .result(result),
        .a(a),
        .b(b)
    );

    initial begin
        // Monitor output
        $monitor("Time = %0t | a = %h | b = %h | result = %h", $time, a, b, result);

        // Test 1: 0 + 0 = 0
        a = 16'h0000; b = 16'h0000;
        #10;

        // Test 2: 1 + 2 = 3
        a = 16'h0001; b = 16'h0002;
        #10;

        // Test 3: 1234 + 5678
        a = 16'h1234; b = 16'h5678;
        #10;

        // Test 4: FFFF + 0001 = 0000 with carry (wraparound, overflow test)
        a = 16'hFFFF; b = 16'h0001;
        #10;

        // Test 5: 8000 + 8000 = 0000 with carry
        a = 16'h8000; b = 16'h8000;
        #10;

        // Test 6: Random large values
        a = 16'hABCD; b = 16'h1234;
        #10;

        $finish;
    end

endmodule
