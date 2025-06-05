`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 11:24:49 AM
// Design Name: 
// Module Name: adder
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


module adder(
        input [15:0] a, b,
        output [15:0] result

    );

    wire [15:0] g_0;
    wire [15:0] p_0;
    wire [15:0] g_1;
    wire [15:0] p_1;
    wire [15:0] g_2;
    wire [15:0] p_2;
    wire [15:0] g_3;
    wire [15:0] p_3;
    wire [15:0] g_4;
    wire [15:0] p_4;
          
   wire [15:0] c_in;

   
   genvar i;
    generate
   
        for(i = 0; i < 16; i = i + 1) begin : preprocess
           assign g_0[i] = a[i] & b[i]; 
           assign p_0[i] = a[i] ^ b[i];
        end 
    

        assign p_1[0] = p_0[0];
        assign g_1[0] = g_0[0];        
        for(i = 1; i < 16; i = i +1) begin : stage_1
            assign g_1[i] = g_0[i] | (p_0[i] & g_0[i-1]);
            assign p_1[i] = p_0[i] & p_0[i-1];
        end
        
        assign p_2[0] = p_1[0];
        assign g_2[0] = g_1[0];
        assign p_2[1] = p_1[1];
        assign g_2[1] = g_1[1];
        for(i = 2 ; i < 16; i = i +1) begin : stage_2
            assign g_2[i] = g_1[i] | (p_1[i] & g_1[i-2]);
            assign p_2[i] = p_1[i] & p_1[i-2];
        end

    // Propagate unchanged signals for bits < 4 in stage 3
    for(i = 0; i < 4; i = i + 1) begin
        assign g_3[i] = g_2[i];
        assign p_3[i] = p_2[i];
    end
    
 // Stage 3: distance = 4
    for(i = 4 ; i < 16; i = i +1) begin : stage_3
        assign g_3[i] = g_2[i] | (p_2[i] & g_2[i-4]);
        assign p_3[i] = p_2[i] & p_2[i-4];
    end

    // Propagate unchanged signals for bits < 8 in stage 4
    for(i = 0; i < 8; i = i + 1) begin
        assign g_4[i] = g_3[i];
        assign p_4[i] = p_3[i];
    end
    
    // Stage 4: distance = 8
    for(i = 8; i < 16; i = i + 1) begin : stage_4
        assign g_4[i] = g_3[i] | (p_3[i] & g_3[i-8]);
        assign p_4[i] = p_3[i] & p_3[i-8];
    end


   assign c_in[0] = 0;
    // Carry in calculation using g_4 and p_4
    for(i = 1; i < 16; i = i + 1) begin : cin
        assign c_in[i] = g_4[i-1] | (p_4[i-1] & c_in[i-1]);
    end

    // Sum calculation using p_0 and carry
    for(i = 0; i < 16; i = i + 1) begin : get_result
        assign result[i] = p_0[i] ^ c_in[i];
    end

     endgenerate
    
    endmodule
    
    
