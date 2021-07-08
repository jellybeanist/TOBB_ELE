`timescale 1ns / 1ps

module tb_bib3();


    wire[3:0] tb_sonuc;
    reg[8:0] tb_buyruk;
    
    bib3 uut(
        .buyruk(tb_buyruk),
        .sonuc(tb_sonuc)
    );
    
    initial begin
        tb_buyruk = 9'b000_011_001;
        #30;
        tb_buyruk = 9'b001_011_001;
        #30;
        tb_buyruk = 9'b010_010_101;
        #30;
        tb_buyruk = 9'b011_010_101;
        #30;
        tb_buyruk = 9'b100_010_101;
        #30;
        tb_buyruk = 9'b101_010_101;
        #30;
        tb_buyruk = 9'b110_010_101;
        #30;
        tb_buyruk = 9'b111_010_101;
        #30;
    end
    
endmodule
