`timescale 1ns / 1ps


module FPGAmult3bit(
    input [2:0] num1,
    input [2:0] num2,
    output [5:0] res  
);

mult3bit m(
    .num1(num1),
    .num2(num2),
    .result(res)
);

endmodule
