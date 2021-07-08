`timescale 1ns / 1ps

module Adder3bit(
		//3 bitlik grup. 
		//sayi1[0], sayi1[1], sayi1[2] seklinde ifade edilebilir
        input[2:0] sayi1,
        input[2:0] sayi2,
        output[3:0] toplam
    );
 //-------------------0. bitlerin hesaplanmasÄ±
	//Carry_in 0 oldÄŸunu iÃ§in onun olduÄŸu kapÄ±larda direk atama yapÄ±ldÄ±
	xor (toplam[0],	sayi1[0],	sayi2[0]);
	wire carry_out_0;
	and	(carry_out_0, sayi1[0], sayi2[0]);
 //-------------------1. bitlerin hesaplanmasÄ±
	wire temp_ab_xor_1, temp_ab_and_1;
    wire temp_Cin_and_1;	//Cin giriÅŸi ile temp_ab_xor'un and sonucu
    wire carry_out_1;
    
	xor (temp_ab_xor_1,	sayi1[1],	sayi2[1]);
	xor (toplam[1],	carry_out_0,	temp_ab_xor_1);
	
	and	(temp_Cin_and_1,	carry_out_0,	temp_ab_xor_1);
	and	(temp_ab_and_1, sayi1[1], sayi2[1]);
	or	(carry_out_1, temp_ab_and_1, temp_Cin_and_1);
 //-------------------2. bitlerin hesaplanmasÄ±
	wire temp_ab_xor_2, temp_ab_and_2;
    wire temp_Cin_and_2;	//Cin giriÅŸi ile temp_ab_xor'un and sonucu
    wire carry_out_2;
	
	xor (temp_ab_xor_2,	sayi1[2],	sayi2[2]);
	xor (toplam[2],	carry_out_1,	temp_ab_xor_2);
	
	and	(temp_Cin_and_2,	carry_out_1,	temp_ab_xor_2);
	and	(temp_ab_and_2, sayi1[2], sayi2[2]);
	or	(toplam[3], temp_ab_and_2, temp_Cin_and_2);
	
    
endmodule
