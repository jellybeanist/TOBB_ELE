`timescale 1ns / 1ps


module tb_half_adder;

    reg a;
    reg b;
    wire sum;
    wire carry_out;

    half_adder uut(
    .a(a),
    .b(b),
    .sum(sum),
    .carry_out(carry_out)
    );

    initial begin
        a=0;
        b=0;
        #15;

        a=0;
        b=1;
        #15;

        a=1;
        b=0;
        #15;

        a=1;
        b=1;
    end
endmodule

