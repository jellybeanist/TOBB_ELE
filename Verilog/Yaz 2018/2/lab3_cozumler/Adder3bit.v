`timescale 1ns / 1ps



module Adder3bit(
		//3 bitlik grup. 
		//sayi1[0], sayi1[1], sayi1[2] seklinde ifade edilebilir
        input[2:0] sayi1,
        input[2:0] sayi2,
        output[3:0] toplam
    );
 
	/*
	3 bitlik soplayici 3 adet 1 bitlik toplayici kullaniyor, daha once
	tanimladigimiz tam toplayici modulunun 3 kopyasini olusturalim.
	Modulleri baglamak icin yalnizca bir onceki modulun elde cikisini
	bir	sonraki modulun elde girisine baglamamiz yeterli.
	*/
 
    //ilk basamak
    wire h1_c_out;
    half_adder h1 (.A(sayi1[0]), .B(sayi2[0]), .carry_out(h1_c_out), .SUM(toplam[0]));
    
    //ikinci basamak
    wire f1_c_out;
    full_adder f1 (.A(sayi1[1]), .B(sayi2[1]), .carry_in(h1_c_out), .carry_out(f1_c_out), .SUM(toplam[1]));
    
    //ucuncu basamak
    wire f2_c_out;
    full_adder f2 (.A(sayi1[2]), .B(sayi2[2]), .carry_in(f1_c_out), .carry_out(f2_c_out), .SUM(toplam[2]));
    
    /* assign islemi, bir wire degiskeninin degerini baska bir degiskene atamak
	icin kullanilabilir. Bunu esitligin sol tarafindaki degiskene sasg taraftaki
	kabloyu baglamak gibi dusunebilirsiniz. Burada ucuncu toplayicinin eldesi
	toplamin dorduncu biti olarak atanmis.
	*/
    assign toplam[3] = f2_c_out;
    
endmodule
