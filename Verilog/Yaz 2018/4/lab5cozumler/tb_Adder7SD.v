module tb_Adder7SD();

    reg[5:0] sayi1, sayi2;
    wire[1:0] a, b, c, d, e, f, g;
    wire dp;

    Adder7SD uut(
        .sayi1(sayi1),
        .sayi2(sayi2),
        .A(a), .B(b), .C(c), .D(d),
        .E(e), .F(f), .G(g),
        .DP(dp)
    );
    
    initial begin
        sayi1 = 6'sd8; sayi2 = 6'sd20;
        #10;
        sayi1 = 6'sd8; sayi2 = -6'sd20;
        #10;
        sayi1 = 6'sd25; sayi2 = 6'sd18;
        #10;
        sayi1 = 6'sd13; sayi2 = -6'sd2;
        #10;
    end
    
endmodule