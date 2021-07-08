`timescale 1ns / 1ps

module FPGAbibp(
        input [UZUNLUK-1:0] sayi1,
        input [UZUNLUK-1:0] sayi2,
        input [3:0] btn,
        output [UZUNLUK:0] solLed,
        output [UZUNLUK:0] sagLed        
    );
    
    localparam UZUNLUK = 4;
    
    reg [UZUNLUK*2 + 2:0] buyruk1= {(UZUNLUK*2 + 3){1'b0}};
    reg [UZUNLUK*2 + 2:0] buyruk2= {(UZUNLUK*2 + 3){1'b0}};
    
    bibp #(.UZUNLUK(UZUNLUK)) b1(
        .buyruk(buyruk1),
        .sonuc(solLed)
    );
    
    bibp #(.UZUNLUK(UZUNLUK)) b2(
        .buyruk(buyruk2),
        .sonuc(sagLed)
    );
    
    always@(*) begin
         buyruk1[UZUNLUK*2 - 1:UZUNLUK] = sayi1;
         buyruk2[UZUNLUK*2 - 1:UZUNLUK] = sayi1;
         buyruk1[UZUNLUK -1 :0] = sayi2;
         buyruk2[UZUNLUK -1 :0] = sayi2;
        if(btn==4'b0001) begin //sol
            buyruk1[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b000;
            buyruk2[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b001;
        end
        else if(btn==4'b0010) begin //sag
            buyruk1[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b010;
            buyruk2[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b011;
        end
        else if(btn==4'b0100) begin //yukari
            buyruk1[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b100;
            buyruk2[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b101;
        end
        else begin //asagi
            buyruk1[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b110;
            buyruk2[UZUNLUK*2 + 2:UZUNLUK*2] = 3'b111;
       end
    end
endmodule
