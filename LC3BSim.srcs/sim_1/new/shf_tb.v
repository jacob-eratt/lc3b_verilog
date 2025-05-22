`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 03:30:24 PM
// Design Name: 
// Module Name: shf_tb
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


module shf_tb;

    reg [5:0] ir_signal;
    reg [15:0] sr1;
    wire [15:0] out;
    
    shf uut(
        .sr1(sr1),
        .ir_signal(ir_signal),
        .shf_out(out)
     );
     
     initial begin
         $monitor("ir_signal = %b | sr1 = %h | out = %h", ir_signal, sr1, out);

        //lsf
        sr1 = 16'h2001; ir_signal = 6'b000100; #10
        sr1 = 16'hFFFF; ir_signal = 6'b000000; #10
        sr1 = 16'hFFFF; ir_signal = 6'b100001; #10
        
        //rshfl;
        sr1 = 16'h8000; ir_signal = 6'b011111; #10
        sr1 = 16'h8000; ir_signal = 6'b010010; #10
        sr1 = 16'h8000; ir_signal = 6'b010000; #10
        
        //rshfa
         sr1 = 16'h8000; ir_signal = 6'b111111; #10
         sr1 = 16'h8000; ir_signal = 6'b110010; #10
         sr1 = 16'h8000; ir_signal = 6'b110000; #10
         $finish;
      end
endmodule
