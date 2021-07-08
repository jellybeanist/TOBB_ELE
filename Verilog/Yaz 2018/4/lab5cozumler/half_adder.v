`timescale 1ns / 1ps

module half_adder(
        input a,
        input b,
        output sum,
        output carry_out
    );
    
    xor (sum, a, b);
    and (carry_out, a, b);
    
endmodule
