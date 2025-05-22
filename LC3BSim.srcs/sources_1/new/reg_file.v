`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2025 04:36:01 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input dr_mux_select,
    input sr1_mux_select,
    input [2:0] ir_11_9,
    input [2:0] ir_8_6,
    input [2:0] ir_2_0,
    input ld_reg,
    input [15:0] bus_val,
    output [15:0] sr1_out,
    output [15:0] sr2_out
    );
    
    reg [15:0] regs [0:7];
    reg [2:0] val_7 = 7; 
   
   wire [2:0] dr_reg; 
   wire [2:0] sr1_reg;
   wire [2:0] sr2_reg;
   
   mux_2to1_3bit dr_mux(ir_11_9, val_7, dr_mux_select, dr_reg);
   mux_2to1_3bit sr1_mux(ir_11_9, ir_8_6, sr1_mux_select, sr1_reg);
   
   assign sr1_out = regs[sr1_reg];
   assign sr2_out = regs[sr2_reg];
   assign 
   
    
    
    
    
endmodule
