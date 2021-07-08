`timescale 1ns / 1ps


module TBmult2bit(

    );
    
   reg [1:0] n1, n2;
   wire [3:0] res;
    
    mult2bit m(
        .num1(n1),
        .num2(n2),
        .result(res)
    );
    
    initial begin
        n1 = 2'd0;
        n2 = 2'd1;
        #10;
        
        n1 = 2'd1;
        n2 = 2'd1;
        #10;
        
        n1 = 2'd1;
        n2 = 2'd2;
        #10;
        
        n1 = 2'd2;
        n2 = 2'd2;
        #10;
        
        n1 = 2'd2;
        n2 = 2'd3;
        #10;
        
        n1 = 2'd3;
        n2 = 2'd2;
        #10;
        
        n1 = 2'd3;
        n2 = 2'd3;
        #10;
        
        n1 = 2'd3;
        n2 = 2'd1;
        #10;
        
    end
endmodule
