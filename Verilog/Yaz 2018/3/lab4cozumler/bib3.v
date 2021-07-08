`timescale 1ns / 1ps

module bib3(
        input [8:0] buyruk, //ilk 3 bit islem turu, 3-3 sayilar
        output reg [3:0] sonuc
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
        sonuc = 4'b0000;
        
        case(buyruk[8:6])
            TOPLA: begin
                sonuc = buyruk[5:3] + buyruk[2:0];
            end
            CIKAR: begin
                sonuc = buyruk[5:3] - buyruk[2:0];
            end
            B_AND: begin
                sonuc = buyruk[5:3] & buyruk[2:0];
            end
            B_OR: begin
                sonuc = buyruk[5:3] | buyruk[2:0];
            end
            AND_R: begin
                sonuc[0] = &buyruk[2:0];
            end
            OR_R: begin
                sonuc[0] = |buyruk[2:0];
            end
            CIFT_ESLIK: begin
                sonuc[0] = ^buyruk[2:0];
            end
            TEK_ESLIK: begin
                sonuc[0] = ~(^buyruk[2:0]);
            end
        endcase
    end
endmodule
