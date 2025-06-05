
`timescale 1ns / 1ps


module control_store(
    input clk,
    input BEN,
    input R,
    input [15:0] IR,
    output reg [5:0] state,
    output reg [34:0] control_word // 36 control signals
);
`include "control_store_bits.vh"
    // ROM-style array: 64 rows (states), each with 36 control bits
    reg [35:0] store [0:63];

    wire cond0 = control_word[COND0];
    wire cond1 = control_word[COND1];
    
    wire [5:0] next_j_state;
    reg [5:0] next_state;

 integer i;
initial begin
 

    store[0] =  35'b01001001000000000000000000000000000;
    store[1] =  35'b00001001000001100010000010000000000; 
    store[2]  = 35'b00001110110000000001000011011000000; 
    store[3]  = 35'b00001100010000000001000011011000000; 
    store[4]  = 35'b01101010000000000000000000000000000; 
    store[0]  = 35'b01001001000000000000000000000000000;
    store[1]  = 35'b00001001000001100010000010000000000;
    store[2]  = 35'b00001110110000000001000011011000000;
    store[3]  = 35'b00001100010000000001000011011000000;
    store[4]  = 35'b01101010000000000000000000000000000;
    store[5]  = 35'b00001001000001100010000010000010000;
    store[6]  = 35'b00001100110000000001000011011000001;
    store[7]  = 35'b00001011110000000001000011011000001;
    store[8]  = 35'b00000000000000000000000000000000000;
    store[9]  = 35'b00001001000001100010000010000100000;
    store[10] = 35'b00000000000000000000000000000000000;
    store[11] = 35'b00000000000000000000000000000000000;
    store[12] = 35'b00001001000000010000010011000000000;
    store[13] = 35'b00001001000001100000100010000000000;
    store[14] = 35'b00001001000001000001000000101000001;
    store[15] = 35'b00001110010000000001000000000000000;
    store[16] = 35'b00101000000000000000000000000001110;
    store[17] = 35'b00101000100000000000000000000001100;
    store[18] = 35'b00010000110000011000000000000000000;
    store[19] = 35'b00010000110000011000000000000000000;
    store[20] = 35'b00001001000001011000010111000000000;
    store[21] = 35'b00001001000001011000010100110000001;
    store[22] = 35'b00001001000000010000010000100000001;
    store[23] = 35'b00001000001000000010000000000110010;
    store[24] = 35'b00001000101000000010000000000110000;
    store[25] = 35'b00101100101000000000000000000001010;
    store[26] = 35'b00000000000000000000000000000000000;
    store[27] = 35'b00001001000001100100000000000000010;
    store[28] = 35'b00101110001001001000000100000001010;
    store[29] = 35'b00101110101000000000000000000001000;
    store[30] = 35'b00001001000000010100001000000000010;
    store[31] = 35'b00001001000001100100000000000000000;
    store[32] = 35'b10000000000010000000000000000000000;
    store[33] = 35'b00110000101000000000000000000001010;
    store[34] = 35'b00000000000000000000000000000000000;
    store[35] = 35'b00010000000100000100000000000000010;



    // Zero out remaining entries
    for (i = 36; i < 64; i = i + 1) begin
        store[i] = 36'b0;
    end
  
    state = 6'd18;
    control_word = store[18];
    
 end
  
    //microsequencer logic 
    assign next_j_state[5] = control_word[J5];
    assign next_j_state[4] = control_word[J4];
    assign next_j_state[3] = control_word[J3];
    assign next_j_state[2] = control_word[J2] | (cond1 & !cond0 & BEN);
    assign next_j_state[1] = control_word[J1] | (!cond1 & cond0 & R);
    assign next_j_state[0] = control_word[J0] | (cond0 & cond1 & IR[11]);
    
    always@(*)begin
        if(control_word[IRD] == 1'b1) begin
            next_state = IR[15:12];   
       end else begin  
            next_state = next_j_state;
        end 
     end
     
    always@(posedge clk)begin
        state <= next_state;
        control_word <= store[next_state];
    end
    
        
       
    
endmodule
