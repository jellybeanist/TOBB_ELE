`timescale 1ns / 1ps

module bibp #(parameter UZUNLUK = 6) (
        input[UZUNLUK*2 + 2:0] buyruk,
        output reg[UZUNLUK:0] sonuc
    );
    
    localparam TOPLA = 3'b000;
    localparam CIKAR = 3'b001;
    localparam B_AND = 3'b010;
    localparam B_OR = 3'b011;
    localparam AND_R = 3'b100;
    localparam OR_R = 3'b101;
    localparam CIFT_ESLIK = 3'b110;
    localparam TEK_ESLIK = 3'b111;
    
    always@* begin
        sonuc = {(UZUNLUK + 1){1'b0}};
        
        case(buyruk[UZUNLUK*2 + 2:UZUNLUK*2])
            TOPLA: begin
                sonuc = buyruk[UZUNLUK*2 - 1:UZUNLUK] + buyruk[UZUNLUK - 1:0];
            end
            CIKAR: begin
                sonuc = buyruk[UZUNLUK*2 - 1:UZUNLUK] - buyruk[UZUNLUK - 1:0];
            end
            B_AND: begin
                sonuc = buyruk[UZUNLUK*2 - 1:UZUNLUK] & buyruk[UZUNLUK - 1:0];
            end
            B_OR: begin
                sonuc = buyruk[UZUNLUK*2 - 1:UZUNLUK] | buyruk[UZUNLUK - 1:0];
            end
            AND_R: begin
                sonuc[0] = &buyruk[UZUNLUK - 1:0];
            end
            OR_R: begin
                sonuc[0] = |buyruk[UZUNLUK - 1:0];
            end
            CIFT_ESLIK: begin
                sonuc[0] = ^buyruk[UZUNLUK - 1:0];
            end
            TEK_ESLIK: begin
                sonuc[0] = ~(^buyruk[UZUNLUK - 1:0]);
            end
        endcase
    end
endmodule
