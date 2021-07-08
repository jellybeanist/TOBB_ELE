`timescale 1ns / 1ps


module tb_Adder_LEDs();

    reg[1:0] t_val1, t_val2;
    wire[5:0] t_leds;

    AdderLEDs uut(
        .sayi1(t_val1),
        .sayi2(t_val2),
        .leds(t_leds)
    );
    
    initial begin
        t_val1 = 2'd0;
        t_val2 = 2'd0;
        #50;
        
        t_val1 = 2'd1;
        t_val2 = 2'd0;
        #50;
        
        t_val1 = 2'd2;
        t_val2 = 2'd0;
        #50;
        
        t_val1 = 2'd3;
        t_val2 = 2'd0;
        #50;
        
        t_val1 = 2'd0;
        t_val2 = 2'd1;
        #50;
        
        t_val1 = 2'd1;
        t_val2 = 2'd1;
        #50;
        
        t_val1 = 2'd2;
        t_val2 = 2'd1;
        #50;
        
        t_val1 = 2'd3;
        t_val2 = 2'd1;
        #50;
        
        t_val1 = 2'd0;
        t_val2 = 2'd2;
        #50;
        
        t_val1 = 2'd1;
        t_val2 = 2'd2;
        #50;
        
        t_val1 = 2'd2;
        t_val2 = 2'd2;
        #50;
        
        t_val1 = 2'd3;
        t_val2 = 2'd2;
        #50;
        
        t_val1 = 2'd0;
        t_val2 = 2'd3;
        #50;
        
        t_val1 = 2'd1;
        t_val2 = 2'd3;
        #50;
        
        t_val1 = 2'd2;
        t_val2 = 2'd3;
        #50;
        
        t_val1 = 2'd3;
        t_val2 = 2'd3;
        #50;
    
    end

endmodule
