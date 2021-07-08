`timescale 1ns / 1ps

module full_adder(
        input a,
        input b,
        input carry_in,
        output sum,
        output carry_out
    );
    
    wire h1_c_out, h1_sum;
    wire h2_c_out;
    
    half_adder h1 (.a(a), .b(b), .sum(h1_sum), .carry_out(h1_c_out));
    half_adder h2 (.a(h1_sum), .b(carry_in), .carry_out(h2_c_out), .sum(sum));
    
    or (carry_out, h1_c_out, h2_c_out);
    
    
endmodule
