module debounce(
    input clk,
    input btn_in,
    output reg btn_out
);
    reg [15:0] shift_reg = 16'b0;

    always @(posedge clk) begin
        shift_reg <= {shift_reg[14:0], btn_in};
        if (&shift_reg)         // All 1s
            btn_out <= 1;
        else if (~|shift_reg)   // All 0s
            btn_out <= 0;
    end
endmodule