`timescale 1ns / 1ps

module FPGA_BCDto7SD(
        input [3:0]bcd,
        output [3:0]an,
        output [6:0]segment,
        output dp
        );

    assign an= 4'b1110;
    wire n0,n1,n2,n3,n4,n5,n6,ndp;
    assign segment[0]= ~n0;
    assign segment[1]= ~n1;
    assign segment[2]= ~n2;
    assign segment[3]= ~n3;
    assign segment[4]= ~n4;
    assign segment[5]= ~n5;
    assign segment[6]= ~n6;
    assign dp= ~ndp;

    BCDto7SD disp(
    .bcd(bcd),
    .A(n0),
    .B(n1),
    .C(n2),
    .D(n3),
    .E(n4),
    .F(n5),
    .G(n6),
    .DP(ndp)
    );
    
endmodule
