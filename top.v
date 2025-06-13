// -----------------------------------------------------------------------------
// Module: dice_roller_top
// Author: Ananya Vaidya
// -----------------------------------------------------------------------------

module dice_roller_top (
    input clk,         // Clock signal
    input btn,         // Noisy push button input
    output [6:0] seg   // 7-segment display output
);

    wire debounced_btn;   // Clean, debounced button signal
    wire [2:0] dice_val;  // 3-bit output from LFSR (1 to 6)

    // Debounce the push button input
    debounce u1 (
        .clk(clk),
        .btn_in(btn),
        .btn_out(debounced_btn)
    );

    // Generate pseudo-random dice value (1 to 6)
    lfsr_dice u2 (
        .clk(clk),
        .enable(debounced_btn),
        .dice_out(dice_val)
    );

    // Decode the dice value to 7-segment display encoding
    seven_segment_decoder u3 (
        .number(dice_val),
        .seg(seg)
    );

endmodule
