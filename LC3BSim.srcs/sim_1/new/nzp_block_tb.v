`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2025 11:59:44 AM
// Design Name: 
// Module Name: nzp_block_tb
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


module nzp_block_tb;
    reg clk;
    reg [15:0] bus;
    wire [2:0] nzp;
    reg ld_cc;
    
     nzp_block uut(
   
        .bus_val(bus),
        .ld_cc(ld_cc),
        .nzp(nzp)
        );
        
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        ld_cc = 0;
        bus = 16'd0;
        
        #10
        ld_cc = 1; bus = 16'd0;
        #10
        ld_cc = 0; bus = 16'd1; //testing if ld_cc works
        #10
        ld_cc = 1;
        #10
        ld_cc = 1; bus = 16'd0; //checking nzp set to z 
        #10
        ld_cc = 0; bus = 16'h8000; //checking nzp set to n
        #10
        ld_cc = 1;
        #10
        ld_cc = 0; bus = 16'h7FFF; //checking nzp set to p
        #10
        ld_cc = 1;
        bus = 16'd0002;  
        #6
        bus = 16'h0005;
        #6
        bus = 16'hFFFF;
        #6
        bus = 16'h0000;
       
       end      
    
    

endmodule
