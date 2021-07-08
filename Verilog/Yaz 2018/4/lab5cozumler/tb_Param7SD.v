`timescale 1ns / 1ps

module tb_Param7SD();
    
    reg[3:0] sayi1;
    wire[4:0] a, b, c, d, e, f, g, dp;
        
    Param7SD #(.RAKAM_SAYISI(5)) uut (
        .baslangic_rakami(sayi1),
        .A(a), .B(b), .C(c), .D(d), .E(e), .F(f), .G(g), .DP(dp)
    );
    
    initial begin
        sayi1 = 4'd3;
        #10;
        sayi1 = 4'd7;
        #10;
    end
    
endmodule
