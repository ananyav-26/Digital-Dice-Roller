`timescale 1ns / 1ps

module tb_dice_roller;

    reg clk = 0;
    reg btn = 0;
    wire [6:0] seg;

    // Instantiate the DUT (Device Under Test)
    dice_roller_top dut (
        .clk(clk),
        .btn(btn),
        .seg(seg)
    );

    // Clock generation: 10ns period = 100MHz
    always #5 clk = ~clk;

    initial begin
        $display("Starting Dice Roller Test...");

        // Initial state
        #100;

        // Simulate button press
        btn = 1;
        #20000;     // hold button for 20000ns
        btn = 0;
        #100000;    // wait and observe

        // Another press
        #50000;
        btn = 1;
        #15000;
        btn = 0;

        #100000;

        $display("Test Complete.");
        $finish;
    end
endmodule