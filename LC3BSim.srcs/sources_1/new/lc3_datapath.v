`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2025 04:54:59 PM
// Design Name: 
// Module Name: lc3_datapath
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

`include "control_store_bits.vh"

module lc3_datapath(
    input clk
    );



    wire [15:0] BUS;
    
    wire[1:0] ADDR2MUX_signal, PCMUX_signal, ALUK_signal;
    wire LSHF1_signal, ADDR1MUX_signal, MARMUX_signal, SR2MUX_signal;
    
    wire [15:0] addr2_out, lshf1_out, addr1_out, adder_out;
    wire [15:0] sr1_out, sr2_out, alu_a, alu_b;
    wire LD_IR, LD_PC, LD_CC;

    wire [15:0] bus_mar, bus_pc, bus_alu, bus_shf, bus_mdr, new_pc; 
    reg [15:0] IR, PC, MAR, MDR;
    reg [2:0] NZP;
    
   
    
    wire [10:0] ir_10_0 = IR & 16'h07FF;
    wire [8:0] ir_8_0 = IR & 16'h01FF;
    wire [5:0] ir_5_0 = IR & 16'h002F;
    wire [4:0] ir_4_0 = IR & 16'h001F;
    wire [7:0] ir_7_0 = IR & 16'h00FF;
    
    wire [15:0] offset11 = {{5{ir_10_0[10]}}, ir_10_0};
    wire [15:0] offset9 = {{7{ir_8_0[8]}}, ir_8_0};   
    wire [15:0] offset6 = {{10{ir_5_0[5]}}, ir_5_0}; 
    wire [15:0] trap_vect = ((ir_7_0 & 16'h00FF)<<1);
    wire [15:0] imm5 = {{11{ir_4_0[4]}}, ir_4_0}; //imm5
    
    
    
    mux_4to1_16bit addr2_mux(0, offset6, offset9, offset11,ADDR2MUX_select, addr2_out);
        
    mux_2to1_16bit lshf1(addr2_out, addr2_out<<1 , LSHF1_signal, lshf1_out);
        
    mux_2to1_16bit addr1_mux(PC, sr1_out, ADDR1MUX_signal, addr1_out);
    
    adder add16bit(lshf1_out, addr1_mux, adder_out);
    
    mux_2to1_16bit mar_mux(trap_vect, adder_out, MARMUX_signal, bus_mar);
    
    mux_4to1_16bit pc_mux(PC, PC+2, BUS, PCMUX_signal, new_pc);
    
    mux_2to1_16bit sr2_mux(sr2_out, imm5, SR2MUX_signal, alu_b);
    
    assign alu_a = sr1_out;
    
    ALU alu(alu_a, alu_b, ALUK_signal, bus_alu);
    shf shf(sr1, offset6, bus_shf);
    
    always@(posedge clk)begin
        if(LD_IR)
            IR <= BUS;
         if(LD_PC)
            PC = new_pc;
    end
    
    
endmodule
