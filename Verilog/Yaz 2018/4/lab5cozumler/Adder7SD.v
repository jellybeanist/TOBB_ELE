`timescale 1ns / 1ps

module Adder7SD(
        input[5:0] sayi1,
        input[5:0] sayi2,
        output[1:0] A, B, C, D, E, F, G,
        output reg DP
    );
    
    wire signed[6:0] toplam;
    wire[5:0] carry;
    
    // 0. Basamak
    half_adder ha1(
        .a(sayi1[0]),
        .b(sayi2[0]),
        .sum(toplam[0]),
        .carry_out(carry[0])
    );
    
    // 1. Basamak
    full_adder fa1(
        .a(sayi1[1]),
        .b(sayi2[1]),
        .carry_in(carry[0]),
        .sum(toplam[1]),
        .carry_out(carry[1])
    );
    
    // 2. Basamak
    full_adder fa2(
        .a(sayi1[2]),
        .b(sayi2[2]),
        .carry_in(carry[1]),
        .sum(toplam[2]),
        .carry_out(carry[2])
    );
    
    // 3. Basamak
    full_adder fa3(
        .a(sayi1[3]),
        .b(sayi2[3]),
        .carry_in(carry[2]),
        .sum(toplam[3]),
        .carry_out(carry[3])
    );
    
    // 4. Basamak
    full_adder fa4(
        .a(sayi1[4]),
        .b(sayi2[4]),
        .carry_in(carry[3]),
        .sum(toplam[4]),
        .carry_out(carry[4])
    );
    
    // 5. Basamak
    full_adder fa5(
        .a(sayi1[5]),
        .b(sayi2[5]),
        .carry_in(carry[4]),
        .sum(toplam[5]),
        .carry_out(carry[5])
    );
    
    // 6. Basamak - sign extend etmis oluyoruz
    full_adder fa6(
        .a(sayi1[5]),
        .b(sayi2[5]),
        .carry_in(carry[5]),
        .sum(toplam[6]),
        .carry_out()
    );
    
    
    always@* begin
        DP = 1'b0;
        
        if(toplam[6]) // toplam negatifse DP'yi 1 yapiyoruz
            DP = 1'b1;
    end
    
    reg[3:0] rakam1, rakam2;
    BCDto7SD ssd1(
        .bcd(rakam1),
        .A(A[0]), .B(B[0]), .C(C[0]), .D(D[0]),
        .E(E[0]), .F(F[0]), .G(G[0]),
        .DP()
    );
    
    BCDto7SD ssd2(
        .bcd(rakam2),
        .A(A[1]), .B(B[1]), .C(C[1]), .D(D[1]),
        .E(E[1]), .F(F[1]), .G(G[1]),
        .DP()
    );
    
    reg[6:0] tmp_toplam;
    
    always@* begin
        rakam1 = 4'd0;
        rakam2 = 4'd0;
        
        if(toplam < 7'sd10 && toplam > -7'sd10)
            rakam2 = 4'd0;
        else if(toplam < 7'sd20 && toplam > -7'sd20)
            rakam2 = 4'd1;
        else if(toplam < 7'sd30 && toplam > -7'sd30)
            rakam2 = 4'd2;
        else if(toplam < 7'sd40 && toplam > -7'sd40)
            rakam2 = 4'd3;
        else if(toplam < 7'sd50 && toplam > -7'sd50)
            rakam2 = 4'd4;
        else if(toplam < 7'sd60 && toplam > -7'sd60)
            rakam2 = 4'd5;
        else
            rakam2 = 4'd6;
       
       
       if (toplam[6])
        tmp_toplam = -toplam;
       else
        tmp_toplam = toplam;
             
        case(tmp_toplam % 7'sd10)
            7'sd0: begin
               rakam1 = 4'd0; 
            end
            7'sd1: begin
               rakam1 = 4'd1; 
            end
            7'sd2: begin
               rakam1 = 4'd2; 
            end
            7'sd3: begin
               rakam1 = 4'd3; 
            end
            7'sd4: begin
               rakam1 = 4'd4; 
            end
            7'sd5: begin
               rakam1 = 4'd5; 
            end
            7'sd6: begin
               rakam1 = 4'd6; 
            end
            7'sd7: begin
               rakam1 = 4'd7; 
            end
            7'sd8: begin
               rakam1 = 4'd8; 
            end
            7'sd9: begin
               rakam1 = 4'd9; 
            end
        
        endcase
    end
    
endmodule
