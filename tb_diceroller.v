// -----------------------------------------------------------------------------
// Testbench: tb_dice_roller
// Author: Ananya Vaidya
--------------------------------------------------------------------------------

`timescale 1ns / 1ps

module tb_dice_roller;

    reg clk = 0;        // Clock signal
    reg btn = 0;        // Button input (to trigger dice roll)
    wire [6:0] seg;     // Output from 7-segment decoder

    // Instantiate the DUT (Device Under Test)
    dice_roller_top dut (
        .clk(clk),
        .btn(btn),
        .seg(seg)
    );

    // Clock generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        $display("Starting Dice Roller Test...");

        // Wait for global reset/setup
        #100;

        // Simulate first button press (held for 20 us)
        btn = 1;
        #20000;
        btn = 0;
        #100000; // Observe output after release

        // Simulate second button press (held for 15 us)
        #50000;
        btn = 1;
        #15000;
        btn = 0;

        // Wait for dice to settle
        #100000;

        $display("Test Complete.");
        $finish;
    end

endmodule
