`timescale 1ns / 1ps



module full_adder(
        input A,
        input B,
        input carry_in,
        output SUM,
        output carry_out
    );
    
	// Modul icindeki baglantilari gosteren wire degiskenlerini tanimlayalim.
    wire temp_ab_xor, temp_ab_and;
    wire temp_Cin_and;	//Cin girişi ile temp_ab_xor'un and sonucu
	
	xor (temp_ab_xor,	A,	B);
	xor (SUM,	carry_in,	temp_ab_xor);
	
	and	(temp_Cin_and,	carry_in,	temp_ab_xor);
	and	(temp_ab_and, A, B);
	or	(carry_out, temp_ab_and, temp_Cin_and);
    
endmodule