`timescale 1ns / 1ps

/* 
Oncelikle sonuclara bagli bir dogruluk tablosu olusturalim:

 S2 S1 S0 | L5 L4 L3 L2 L1 L0
------------------------------
 0  0  0  |  0  0  0  0  0  0
 0  0  1  |  0  0  0  0  0  1
 0  1  0  |  0  0  0  0  1  1
 0  1  1  |  0  0  0  1  1  1
 1  0  0  |  0  0  1  1  1  1
 1  0  1  |  0  1  1  1  1  1
 1  1  0  |  1  1  1  1  1  1

Bu tablodan hareketle LEDlere ulasan mantik fonksiyonlarini tanimlayalim:
L0 = S2 + S1 + S0
L1 = S2 + S1
L2 = S2 + (S1.S0)
L3 = S2
L4 = S2.(S1+S0)
L5 = S2.S1

Daha sonra bu fonksiyonlari Verilog ile gercekleyelim.
*/


module AdderLEDs(
        input[1:0] sayi1,
        input[1:0] sayi2,
        output[5:0] leds
    );
    
    wire[3:0] result;
   //-------------------0. bitlerin hesaplanmasÄ±
	//Carry_in 0 oldÄŸunu iÃ§in onun olduÄŸu kapÄ±larda direk atama yapÄ±ldÄ±
	xor (result[0],	sayi1[0],	sayi2[0]);
	wire carry_out_0;
	and	(carry_out_0, sayi1[0], sayi2[0]);
 //-------------------1. bitlerin hesaplanmasÄ±
	wire temp_ab_xor_1, temp_ab_and_1;
    wire temp_Cin_and_1;	//Cin giriÅŸi ile temp_ab_xor'un and sonucu
    wire carry_out_1;
    
	xor (temp_ab_xor_1,	sayi1[1],	sayi2[1]);
	xor (result[1],	carry_out_0,	temp_ab_xor_1);
	
	and	(temp_Cin_and_1,	carry_out_0,	temp_ab_xor_1);
	and	(temp_ab_and_1, sayi1[1], sayi2[1]);
	or	(carry_out_1, temp_ab_and_1, temp_Cin_and_1);
 //-------------------2. bitlerin hesaplanmasÄ±
	wire temp_ab_xor_2, temp_ab_and_2;
    wire temp_Cin_and_2;	//Cin giriÅŸi ile temp_ab_xor'un and sonucu
    wire carry_out_2;
	
	xor (temp_ab_xor_2,	sayi1[2],	sayi2[2]);
	xor (result[2],	carry_out_1,	temp_ab_xor_2);
	
	and	(temp_Cin_and_2,	carry_out_1,	temp_ab_xor_2);
	and	(temp_ab_and_2, sayi1[2], sayi2[2]);
	or	(result[3], temp_ab_and_2, temp_Cin_and_2);
	
    
	// L0 fonksiyonu
    or (leds[0], result[0], result[1], result[2]);
	
	// L1 fonksiyonu
    or (leds[1], result[1], result[2]);
	
    // L2 fonksiyonu
    wire and_0_1;
    and (and_0_1, result[0], result[1]);
    or (leds[2],  result[2], and_0_1);
    
	// L3 fonksiyonu
    assign leds[3] = result[2];
	
	// L4 fonksiyonu
	wire or_0_1;
    or (or_0_1, result[0], result[1]);
	and (leds[4], result[2], or_0_1);

    // L5 fonksiyonu
    and(leds[5], result[1], result[2]);       
        
endmodule
