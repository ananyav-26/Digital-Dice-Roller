// -----------------------------------------------------------------------------
// Module: seven_segment_decoder
// Author: Ananya Vaidya
// -----------------------------------------------------------------------------

module seven_segment_decoder (
    input [2:0] number,       // 3-bit input number (expected range: 1 to 6)
    output reg [6:0] seg      // 7-segment output: seg[6] = g, seg[0] = a
);

    always @(*) begin
        case (number)
            3'd1: seg = 7'b1111001; // Displays '1'
            3'd2: seg = 7'b0100100; // Displays '2'
            3'd3: seg = 7'b0110000; // Displays '3'
            3'd4: seg = 7'b0011001; // Displays '4'
            3'd5: seg = 7'b0010010; // Displays '5'
            3'd6: seg = 7'b0000010; // Displays '6'
            default: seg = 7'b1111111; // Blank display for invalid input
        endcase
    end

endmodule
