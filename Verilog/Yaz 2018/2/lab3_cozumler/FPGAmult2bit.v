`timescale 1ns / 1ps


module FPGAmult2bit(
    input [1:0] num1,
    input [1:0] num2,
    output [3:0] res  
    );
    
    
    mult2bit m(
        .num1(num1),
        .num2(num2),
        .result(res)
    );
    
endmodule
