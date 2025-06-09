`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2025 11:23:18 AM
// Design Name: 
// Module Name: logic_block
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


module nzp_block(
    input ld_cc,
    input [15:0] bus_val,
    output reg [2:0] nzp
    );
    
    
    always@(*)begin
        if (ld_cc) begin
            if (bus_val[15] == 1)
                nzp <= 3'b100;
            else if (bus_val == 16'd0)
                nzp <= 3'b010;
            else
                nzp <= 3'b001;
        end
    end         
    
    
endmodule
