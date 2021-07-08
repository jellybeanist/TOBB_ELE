`timescale 1ns / 1ps

module tb_full_adder;

	reg a;
	reg b;
	reg carry_in;
	wire sum;
	wire carry_out;

	full_adder uut(
	    .A(a),
	    .B(b),
	    .carry_in(carry_in),
	    .SUM(sum),
	    .carry_out(carry_out)
	);

	initial begin
	    a=0;
	    b=0;
	    carry_in=0;
	    #15;

	    a=0;
	    b=0;
	    carry_in=1;
	    #15;

	    a=0;
	    b=1;
	    carry_in=0;
	    #15;

	    a=0;
	    b=1;
	    carry_in=1;
	    #15;

	    a=1;
	    b=0;
	    carry_in=0;
	    #15;

	    a=1;
	    b=0;
	    carry_in=1;
	    #15;

	    a=1;
	    b=1;
	    carry_in=0;
	    #15;

	    a=1;
	    b=1;
	    carry_in=1;
        end
endmodule

