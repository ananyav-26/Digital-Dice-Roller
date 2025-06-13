module dice_roller_top(
    input clk,
    input btn,
    output [6:0] seg
);
    wire debounced_btn;
    wire [2:0] dice_val;

    debounce u1 (
        .clk(clk),
        .btn_in(btn),
        .btn_out(debounced_btn)
    );

    lfsr_dice u2 (
        .clk(clk),
        .enable(debounced_btn),
        .dice_out(dice_val)
    );

    seven_segment_decoder u3 (
        .number(dice_val),
        .seg(seg)
    );
endmodule