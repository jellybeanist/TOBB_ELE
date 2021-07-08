module tb_mul2bit();

    reg[1:0] n1, n2;
    wire[3:0] res;
    
    mult2bit uut(
        .a(n1),
        .b(n2),
        .c(res)
    );
    
    initial begin
        n1 = 2'd2;
        n2 = 2'd3;
        #10;
        
        n1 = 2'd2;
        n2 = 2'd3;
        #10;
        
        n1 = 2'd3;
        n2 = 2'd3;
        #10;
        
        n1 = 2'd1;
        n2 = 2'd3;
        #10;
        
        n1 = 2'd2;
        n2 = 2'd0;
        #10;
        
        n1 = 2'd1;
        n2 = 2'd3;
        #10;
        
        n1 = 2'd2;
        n2 = 2'd1;
        #10;
        
        n1 = 2'd1;
        n2 = 2'd1;
        #10;
    
    end
    
endmodule
