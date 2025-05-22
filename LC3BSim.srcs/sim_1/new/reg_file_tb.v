`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2025 04:01:55 PM
// Design Name: 
// Module Name: reg_file_tb
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

module reg_file_tb;

    reg clk;
    reg dr_mux_select;
    reg sr1_mux_select;
    reg [2:0] ir_11_9;
    reg [2:0] ir_8_6;
    reg [2:0] ir_2_0;
    reg ld_reg;
    reg [15:0] bus_val;
    wire [15:0] sr1_out;
    wire [15:0] sr2_out;

    // Instantiate the reg_file
    reg_file uut (
        .clk(clk),
        .dr_mux_select(dr_mux_select),
        .sr1_mux_select(sr1_mux_select),
        .ir_11_9(ir_11_9),
        .ir_8_6(ir_8_6),
        .ir_2_0(ir_2_0),
        .ld_reg(ld_reg),
        .bus_val(bus_val),
        .sr1_out(sr1_out),
        .sr2_out(sr2_out)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        dr_mux_select = 0;
        sr1_mux_select = 0;
        ir_11_9 = 3'd0;
        ir_8_6 = 3'd1;
        ir_2_0 = 3'd2;
        ld_reg = 0;
        bus_val = 16'h0000;

        // Wait a little for global reset
        #10;

        // Load value 0xAAAA into register addressed by dr_reg = ir_11_9 (select 0)
        ir_11_9 = 3'd3;   // destination reg 3
        dr_mux_select = 0; // select ir_11_9 (3)
        bus_val = 16'hAAAA;
        ld_reg = 1;       // enable loading
        #10;              // one clock cycle

        ld_reg = 0;       // disable loading
        #10;

        // Load value 0x5555 into register 7 (since dr_mux_select=1 selects reg 7)
        dr_mux_select = 1; // select register 7
        bus_val = 16'h5555;
        ld_reg = 1;
        #10;
        ld_reg = 0;
        #10;

        // Read from sr1 and sr2 with sr1_mux_select = 0 (select ir_11_9) and = 1 (select ir_8_6)
        ir_11_9 = 3'd3;    // reg 3 contains 0xAAAA
        ir_8_6 = 3'd7;     // reg 7 contains 0x5555
        ir_2_0 = 3'd2;     // reg 2 not loaded, expect default 0

        sr1_mux_select = 0;
        #10;
        $display("sr1_mux_select=0: sr1_out=%h (expect AAAA), sr2_out=%h (expect 0000)", sr1_out, sr2_out);

        sr1_mux_select = 1;
        #10;
        $display("sr1_mux_select=1: sr1_out=%h (expect 5555), sr2_out=%h (expect 0000)", sr1_out, sr2_out);

        // Finish simulation
        #10;
        $finish;
    end

endmodule

