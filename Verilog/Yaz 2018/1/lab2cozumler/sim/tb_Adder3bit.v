`timescale 1ns / 1ps


module tb_Adder3bit();

    reg[2:0] t_val1, t_val2;
    wire[3:0] t_result;
    
    Adder3bit uut(
        .sayi1(t_val1),
        .sayi2(t_val2),
        .toplam(t_result)
    );
    
    
    initial begin
        t_val1 = 3'd0;
        t_val2 = 3'd0;
        #50;
        
        t_val1 = 3'd5;
        t_val2 = 3'd0;
        #50;
        
        t_val1 = 3'd5;
        t_val2 = 3'd4;
        #50;
        
        t_val1 = 3'd3;
        t_val2 = 3'd3;
        #50;
        
        t_val1 = 3'd6;
        t_val2 = 3'd1;
        #50;
        
        t_val1 = 3'd5;
        t_val2 = 3'd2;
        #50;
        
        t_val1 = 3'd7;
        t_val2 = 3'd7;
        #50;
        
        t_val1 = 3'd1;
        t_val2 = 3'd1;
        #50;
    
    end

endmodule
