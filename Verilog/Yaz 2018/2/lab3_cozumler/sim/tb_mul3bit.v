`timescale 1ns / 1ps


module tb_mul3bit();

    reg[2:0] n1, n2;
    wire[5:0] res;
    
    mult3bit uut(
        .A(n1),
        .B(n2),
        .c(res)
    );
    
    initial begin
        n1 = 3'd2;
        n2 = 3'd3;
        #10;
        
        n1 = 3'd2;
        n2 = 3'd3;
        #10;
        
        n1 = 3'd3;
        n2 = 3'd3;
        #10;
        
        n1 = 3'd1;
        n2 = 3'd3;
        #10;
        
        n1 = 3'd2;
        n2 = 3'd0;
        #10;
        
        n1 = 3'd1;
        n2 = 3'd3;
        #10;
        
        n1 = 3'd2;
        n2 = 3'd1;
        #10;
        
        n1 = 3'd1;
        n2 = 3'd1;
        #10;
        
        n1 = 3'd7;
        n2 = 3'd7;
        #10;
        
        n1 = 3'd6;
        n2 = 3'd5;
        #10;
        
        n1 = 3'd7;
        n2 = 3'd3;
        #10;
        
        n1 = 3'd5;
        n2 = 3'd4;
        #10;
    
    end

endmodule
