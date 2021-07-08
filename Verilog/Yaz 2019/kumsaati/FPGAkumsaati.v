`timescale 1ns / 1ps

module FPGAkumsaati(
    input btn, clk,
    output [3:0] an,
    output dp,
    output [15:0] led,
    output [6:0] seg
    );
    
    kumsaati #(.C(6), .A(1), .N(2)) saat(
    .btn(btn),
    .clk(clk),
    .an(an),
    .dp(dp),
    .led_left(led[15:8]),
    .led_right(led[7:0]),
    .seg(seg)
    );
endmodule
