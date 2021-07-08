`timescale 1ns / 1ps

/*
   A1A0			A  B  | A*B
   B1B0		   -------------  ====> A*B = A ve B
  *-----		0  0  |  0
   a1a0			0  1  |  0
 b1b0			1  0  |  0
+-------		1  1  |  1
c3c2c1c0

c0 = a0 = A0 ve B0

a1 = A1 ve B0
b0 = A0 ve B0
c1 = a1 + b0

b1 = A1 ve B1
c2 = b1 + carry(a1 + b0)

c3 = carry(b1 + carry(a1+b0))

Iki bit carpici icin,

	* 2 x Half Adder
	* 4 x AND kapisi
	
kullanilmasi yeterli.
*/

// Yukaridaki carpimi gercekleyen modul.
module mult2bit(
        input[1:0] A,
        input[1:0] B,
        output[3:0] c
    );
    
    and (c[0], A[0], B[0]);
    
    // a1 ve b0 icin ara degerler tanimlayalim. 
    wire a10, b0;
    and (a1, A[1], B[0]);
    and (b0, A[0], B[1]);
    
    wire carry1;
    
    // a1 + b0 islemini yapan half adder.
    half_adder ha1(
        .a(a1),
        .b(b0),
        .sum(c[1]),
        .carry_out(carry1)
    );
    // b1 icin ara deger tanimlayalim.
    wire b1;
    and (b1, A[1], B[1]);

    // b1 + carry(a1 + b0) islemini yapan half adder.
    half_adder ha2(
        .a(b1),
        .b(carry),
        .sum(c[2]),
        .carry_out(c[3])
    );
    
endmodule
