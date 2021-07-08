module tb_BCDto7SD();

    reg[3:0] sayi;
    wire tb_A, tb_B, tb_C;
    wire tb_D, tb_E, tb_F;
    wire tb_G, tb_DP;
    
    BCDto7SD uut(
        .bcd(sayi),
        .A(tb_A), .B(tb_B), .C(tb_C),
        .D(tb_D), .E(tb_E), .F(tb_F),
        .G(tb_G), .DP(tb_DP)
    );
    
    initial begin
        sayi = 4'd0;
        #10;
        sayi = 4'd1;
        #10;
        sayi = 4'd2;
        #10;
        sayi = 4'd3;
        #10;
        sayi = 4'd4;
        #10;
        sayi = 4'd5;
        #10;
        sayi = 4'd6;
        #10;
        sayi = 4'd7;
        #10;
        sayi = 4'd8;
        #10;
        sayi = 4'd9;
        #10;
    end
    
endmodule