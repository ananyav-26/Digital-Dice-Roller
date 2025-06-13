module seven_segment_decoder (
    input [2:0] number,
    output reg [6:0] seg
);
    always @(*) begin
        case (number)
            3'd1: seg = 7'b1111001;
            3'd2: seg = 7'b0100100;
            3'd3: seg = 7'b0110000;
            3'd4: seg = 7'b0011001;
            3'd5: seg = 7'b0010010;
            3'd6: seg = 7'b0000010;
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule