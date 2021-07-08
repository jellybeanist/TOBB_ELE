`timescale 1ns / 1ps

/*
      A2A1A0		A  B  | A*B
      B2B1B0	    -------------  ====> A*B = A ve B
     *------		0  0  |  0
      a2a1a0		0  1  |  0
    b2b1b0			1  0  |  0
  d2d1d0			1  1  |  1
 +----------		
c5c4c3c2c1c0

3 bitlik iki sayinin carpimini yapan mantik devresi:

				  b2   0      b1   a2     b0   a1    a0
				 _|____|_    _|____|_    _|____|_    |
				 |		|    |		|    |		|    |
			  _c_| F.A. |<-c-| F.A. |<-c-| F.A. |<-0-|
			  |	 |______|    |______|    |______|    |
		  d2  |		   |   d1     |    d0      |     |
		 _|___v__    __v___|_    _v____|_      |     |
		 |		|    |		|    |		|      |     |
	  _c_| F.A. |<-c-| F.A. |<-c-| F.A. |<-0-  |     |
	  |	 |______|    |______|    |______|      |     |
	  |		   |		   |		   |	   |	 |
	  v		   v		   v		   v       v     v
	  c5       c4          c3          c2      c1    c0
*/

module mult3bit(
        input[2:0] A,
        input[2:0] B,
        output[5:0] c
    );
	
	// Ara degerler icin wire degiskenleri tanimlayalim:
	wire a2, a1, a0;
	wire b2, b1, b0;
	wire d2, d1, d0;
	
	// Ara degerleri hesaplayalim:
	and (a0, A[0], B[0]);
	and (a1, A[1], B[0]);
	and (a2, A[2], B[0]);
	
	and (b0, A[0], B[1]);
	and (b1, A[1], B[1]);
	and (b2, A[2], B[1]);
	
	and (d0, A[0], B[2]);
	and (d1, A[1], B[2]);
	and (d2, A[2], B[2]);
 
	// Sonuclari hesaplayalim:
    // 1. basamak
    assign c[0] = a0;
    
    // 2. basamak
	wire carry_1;
	
	full_adder fa1(
		.a(a1),
		.b(b0),
		.carry_in(0),
		.sum(c[1]),
		.carry_out(carry_1)
	);
    
    // 3. basamak
	wire sum_1;
	wire carry_2;
	wire carry_4;
	
	full_adder fa2(
		.a(a2),
		.b(b1),
		.carry_in(carry_1),
		.sum(sum_1),
		.carry_out(carry_2)
	);
	
	full_adder fa3(
		.a(d0),
		.b(sum_1),
		.carry_in(0),
		.sum(c[2]),
		.carry_out(carry_4)
	);
    
    // 4. basamak
	wire sum_2;
	wire carry_3;
	wire carry_5;
	
 	full_adder fa4(
		.a(0),
		.b(b2),
		.carry_in(carry_2),
		.sum(sum_2),
		.carry_out(carry_3)
	);
	
	full_adder fa5(
		.a(d1),
		.b(sum_2),
		.carry_in(carry_4),
		.sum(c[3]),
		.carry_out(carry_5)
	);   
    
    // 5. Basamak	
	full_adder fa6(
		.a(carry_3),
		.b(d2),
		.carry_in(carry_5),
		.sum(c[4]),
		.carry_out(c[5])
	);
    
endmodule
