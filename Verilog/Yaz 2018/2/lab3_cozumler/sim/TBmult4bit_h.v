`timescale 1ns / 1ps


module TBmult4bit_h(

    );
      reg [3:0] n1, n2;
      wire [7:0] res;
       
       mult4bit_h m(
           .num1(n1),
           .num2(n2),
           .result(res)
       );
       
       initial begin
           n1 = 4'd15;
           n2 = 4'd15;
           #10;
           
           n1 = 4'd14;
           n2 = 4'd13;
           #10;
           
           n1 = 4'd11;
           n2 = 4'd12;
           #10;
           
           n1 = 4'd10;
           n2 = 4'd9;
           #10;
           
           n1 = 4'd7;
           n2 = 4'd8;
           #10;
           
           n1 = 4'd6;
           n2 = 4'd5;
           #10;
           
           n1 = 4'd3;
           n2 = 4'd4;
           #10;
           
           n1 = 4'd1;
           n2 = 4'd2;
           #10;
         end 
    
endmodule
