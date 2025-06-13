// -----------------------------------------------------------------------------
// Module: lfsr_dice
// Author: Ananya Vaidya
// -----------------------------------------------------------------------------

module lfsr_dice (
    input clk,                 // Clock signal
    input enable,              // Enable signal to trigger dice roll
    output reg [2:0] dice_out  // Dice output in range 1 to 6
);

    // 4-bit LFSR initialized to a non-zero seed
    reg [3:0] lfsr = 4'b1010;

    // Feedback calculated using XOR of tap bits [3] and [2]
    wire feedback = lfsr[3] ^ lfsr[2];

    always @(posedge clk) begin
        if (enable) begin
            // Shift LFSR (reset to seed if it hits zero)
            lfsr <= (lfsr == 0) ? 4'b1010 : {lfsr[2:0], feedback};

            // Ensure fair dice roll: discard values >= 12
            if (lfsr < 12)
                dice_out <= (lfsr % 6) + 1; // Result range: 1 to 6
        end
    end

endmodule
