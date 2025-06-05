`timescale 1ns / 1ps


module control_store_tb;
`include "control_store_bits.vh"
    reg clk = 0;
    reg BEN = 0;
    reg R = 0;
    reg [15:0] IR = 0;
    wire [5:0] state;
    wire [34:0] control_word;
    wire J5_val = control_word[J5]; 
    wire J4_val = control_word[J4];
    wire J3_val = control_word[J3];
    wire J2_val = control_word[J2];
    wire J1_val = control_word[J1];
    wire J0_val = control_word[J0];

    control_store uut (
        .clk(clk),
        .BEN(BEN),
        .R(R),
        .IR(IR),
        .state(state),
        .control_word(control_word)
    );
    

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Time\tState\tIRD\tJ5..J0\tIR[15:12]");
        $monitor("%g\t%d\t%b\t%b%b%b%b%b%b\t%b",
            $time, state, control_word[IRD],
            control_word[J5], control_word[J4], control_word[J3],
            control_word[J2], control_word[J1], control_word[J0],
            IR[15:12]
        );

        // Initial setup
        BEN = 1;
        R = 1;
        IR = 16'b0000000000000000; // IR[15:12] = 0000

        // Let the ROM load (store[0] to store[1] to store[2]...)
        #100;

        // Walk forward until we see state 18
        // The actual transition depends on your ROM's microsequencing logic
        // So no need to manually set state - let control logic do it

        #200;

        $display("Final state: %d", state);
        if (state == 6'd18)
            $display(" Reached state 18 successfully!");
        else
            $display(" Did not reach state 18.");

        $finish;
    end

endmodule
