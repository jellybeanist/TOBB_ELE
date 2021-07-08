`timescale 1ns / 1ps

module Param7SD #(parameter EKSILECEK_SAYI = 4) (
        input[3:0] baslangic_rakami,
        output A, B, C, D, E, F, G, DP
    );
    
    reg [3:0] bcd;
    BCDto7SD seg(
        .bcd(bcd),
        .A(A), .B(B), .C(C),
        .D(D), .E(E), .F(F),
        .G(G), .DP(DP)
    );
                    
    always@* begin
        if(baslangic_rakami-EKSILECEK_SAYI>baslangic_rakami) // 1 - 4
            bcd = 4'b1010 + baslangic_rakami - EKSILECEK_SAYI;
        else bcd= baslangic_rakami-EKSILECEK_SAYI;
    end
    
endmodule
