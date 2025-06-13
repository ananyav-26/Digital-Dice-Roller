// -----------------------------------------------------------------------------
// Module: debounce
// Author: Ananya Vaidya
// -----------------------------------------------------------------------------

module debounce (
    input clk,           // Clock signal
    input btn_in,        // Noisy button input
    output reg btn_out   // Debounced button output
);

    // Shift register to sample the input over 16 clock cycles
    reg [15:0] shift_reg = 16'b0;

    always @(posedge clk) begin
        // Shift in the latest button input value
        shift_reg <= {shift_reg[14:0], btn_in};

        // If all bits are 1, set output high (button steadily pressed)
        if (&shift_reg)
            btn_out <= 1;

        // If all bits are 0, set output low (button steadily released)
        else if (~|shift_reg)
            btn_out <= 0;
    end

endmodule
