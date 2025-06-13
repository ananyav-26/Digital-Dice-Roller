module lfsr_dice (
    input clk,
    input enable,
    output reg [2:0] dice_out
);
    reg [3:0] lfsr = 4'b1010;
    wire feedback = lfsr[3] ^ lfsr[2];

    always @(posedge clk) begin
        if (enable) begin
            // Shift LFSR
            lfsr <= (lfsr == 0) ? 4'b1010 : {lfsr[2:0], feedback};

            // Fair dice roll: discard values >= 12
            if (lfsr < 12)
                dice_out <= (lfsr % 6) + 1;
        end
    end
endmodule