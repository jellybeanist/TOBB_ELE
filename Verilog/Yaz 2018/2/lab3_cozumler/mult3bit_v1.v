`timescale 1ns / 1ps



module mult3bit(
        input[2:0] num1,
        input[2:0] num2,
        output[5:0] result
    );
    
    //1. basamak
    and (result[0], num1[0], num2[0]);
    
    //2. basamak
    wire a1b0, a0b1, carry2;
    
    and (a1b0, num1[1], num2[0]);
    and (a0b1, num1[0], num2[1]);
    
    half_adder ha1(
        .a(a1b0),
        .b(a0b1),
        .sum(result[1]),
        .carry_out(carry2)
    );
    
    //3. basamak
    wire a2b0, a1b1, a0b2, carry3;
    wire tmp_sum1, tmp_sum2;
    wire tmp_carry1, tmp_carry2, tmp_carry3;
    wire carry4_1;
    
    and (a2b0, num1[2], num2[0]);
    and (a1b1, num1[1], num2[1]);
    and (a0b2, num1[0], num2[2]);
    
    half_adder ha2(
        .a(a2b0),
        .b(a1b1),
        .sum(tmp_sum1),
        .carry_out(tmp_carry1)
    );
    
    half_adder ha3(
        .a(a0b2),
        .b(carry2),
        .sum(tmp_sum2),
        .carry_out(tmp_carry2)
    );
    
    half_adder ha4(
        .a(tmp_sum1),
        .b(tmp_sum2),
        .sum(result[2]),
        .carry_out(tmp_carry3)
    );
    
    full_adder fa1(
        .a(tmp_carry1),
        .b(tmp_carry2),
        .carry_in(tmp_carry3),
        .sum(carry3),
        .carry_out(carry4_1)
    );
    
    //4. basamak
    wire a2b1, a1b2;
    
    and (a2b1, num1[2], num2[1]);
    and (a1b2, num1[1], num2[2]);
    
    wire tmp1_carry1;
    wire carry4;
    
    full_adder fa2(
        .a(a2b1),
        .b(a1b2),
        .carry_in(carry3),
        .sum(result[3]),
        .carry_out(carry4_2)
    );
    
    //5. Basamak
    wire a2b2;
    
    and (a2b2, num1[2], num2[2]);
    
    full_adder fa3(
        .a(a2b2),
        .b(carry4_1),
        .carry_in(carry4_2),
        .sum(result[4]),
        .carry_out(result[5])
    );
    
endmodule
