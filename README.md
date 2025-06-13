A simple digital dice roller implemented in Verilog HDL, featuring:
- A debounced push button for user input
- A pseudo-random number generator using a Linear Feedback Shift Register (LFSR)
- A seven-segment decoder for visual display of dice values (1–6)

## Modules Included

1. `debounce`
   - Debounces a noisy push button input using a 16-bit shift register.
   - Filters out mechanical noise to produce a clean high/low signal.

2. `lfsr_dice`
   - Generates pseudo-random values using a 4-bit LFSR.
   - Outputs values from 1 to 6 by applying modulo arithmetic.
   - Prevents bias by filtering out high LFSR values.

3. `seven_segment_decoder`
   - Maps dice values (1–6) to corresponding 7-segment display encodings.
   - Output format assumes a common cathode display.

4. `dice_roller_top`
   - Top-level module that integrates:
     - Debounced button logic
     - Dice generator
     - 7-segment output

5. `tb_dice_roller`
   - A simple testbench that:
     - Simulates button presses
     - Drives the clock
     - Observes output transitions on the 7-segment `seg` signal

## Mapping Table

===============================================================
| Dice Value (number) | 7-Segment Code (seg) | Displayed Digit |
===============================================================
|        3'd1         |     7'b1111001       |        1        |
|        3'd2         |     7'b0100100       |        2        |
|        3'd3         |     7'b0110000       |        3        |
|        3'd4         |     7'b0011001       |        4        |
|        3'd5         |     7'b0010010       |        5        |
|        3'd6         |     7'b0000010       |        6        |
|      default        |     7'b1111111       |   (blank/off)   |
===============================================================

## Outputs
RTL Schematic:
Output Waveform:
