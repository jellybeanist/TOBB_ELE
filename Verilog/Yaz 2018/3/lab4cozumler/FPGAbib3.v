`timescale 1ns / 1ps

module FPGAbib3(
        input [2:0] sayi1,
        input [2:0] sayi2,
        input [3:0] btn,
        output [3:0] solLed,
        output [3:0] sagLed        
    );
    
    reg [8:0] buyruk1= 9'd0;
    reg [8:0] buyruk2= 9'd0;
  
	//İki islem birimi modulu ornegi olusturalim.
    bib3 b1(
        .buyruk(buyruk1),
        .sonuc(solLed)
    );
    
    bib3 b2(
        .buyruk(buyruk2),
        .sonuc(sagLed)
    );
    
    always@(*) begin
         buyruk1[5:3] = sayi1;
         buyruk1[2:0] = sayi2;
         buyruk2[5:3] = sayi1;
         buyruk2[2:0] = sayi2;
		 
		//Butonlara basilma durumuna gore islem kodlarini ayarlayalim.
        if(btn==4'b0001) begin //sol
            buyruk1[8:6] = 3'b000;
            buyruk2[8:6] = 3'b001;
        end
        else if(btn==4'b0010) begin //sag
            buyruk1[8:6] = 3'b010;
            buyruk2[8:6] = 3'b011;
        end
        else if(btn==4'b0100) begin //yukari
            buyruk1[8:6] = 3'b100;
            buyruk2[8:6] = 3'b101;
        end
        else begin //asagi
            buyruk1[8:6] = 3'b110;
            buyruk2[8:6] = 3'b111;
       end
    end
endmodule
