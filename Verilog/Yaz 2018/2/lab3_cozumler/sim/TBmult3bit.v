`timescale 1ns / 1ps


module TBmult3bit(

    );
    
   reg [2:0] n1, n2;
   wire [5:0] res;
    
    mult3bit m(
        .num1(n1),
        .num2(n2),
        .result(res)
    );
    
    initial begin
        n1 = 3'd0;
        n2 = 3'd2;
        #10;
        
        n1 = 3'd4;
        n2 = 3'd5;
        #10;
        
        n1 = 3'd6;
        n2 = 3'd6;
        #10;
        
        n1 = 3'd1;
        n2 = 3'd2;
        #10;
        
        n1 = 3'd2;
        n2 = 3'd3;
        #10;
        
        n1 = 3'd3;
        n2 = 3'd4;
        #10;
        
        n1 = 3'd5;
        n2 = 3'd6;
        #10;
        
        n1 = 3'd7;
        n2 = 3'd7;
        #10;
        
    end
endmodule
