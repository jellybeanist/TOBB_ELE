`timescale 1ns / 1ps

module FPGA_Adder7SD(
        input [5:0]bcd1,
        input [5:0]bcd2,
        output [3:0]an,
        output [6:0]segment,
        output dp,
        output reg [3:0]led
    );

    assign an= 4'b1110;
    wire [1:0]n0,n1,n2,n3,n4,n5,n6;
    wire ndp;
    assign segment[0]= ~n0[1];
    assign segment[1]= ~n1[1];
    assign segment[2]= ~n2[1];
    assign segment[3]= ~n3[1];
    assign segment[4]= ~n4[1];
    assign segment[5]= ~n5[1];
    assign segment[6]= ~n6[1];
    assign dp= ~ndp;

    Adder7SD disp(
    .sayi1(bcd1),
    .sayi2(bcd2),
    .A(n0),
    .B(n1),
    .C(n2),
    .D(n3),
    .E(n4),
    .F(n5),
    .G(n6),
    .DP(ndp)
    );
    
    always@* begin
        case ({n0[0],n1[0],n2[0],n3[0],n4[0],n5[0],n6[0]})
            7'b1111_110: led= 4'd0;
            7'b0110_000: led= 4'd1;
            7'b1101_101: led= 4'd2;
            7'b1111_001: led= 4'd3;
            7'b0110_011: led= 4'd4;
            
            7'b1011_011: led= 4'd5;
            7'b1011_111: led= 4'd6;
            7'b1110_000: led= 4'd7;
            7'b1111_111: led= 4'd8;
            7'b1110_011: led= 4'd9;
            default: led= 4'd0; 
        endcase
    end
        
endmodule
