`timescale 1ns / 1ps



module half_adder(
        input a,
        input b,
        output sum,
        output carry_out
    );
    //Toplamin sonucunu veren ozel veya kapisi
    xor (sum, a, b);
	// Elde hesabini yapan ve kapisi
    and (carry_out, a, b);
    
endmodule
