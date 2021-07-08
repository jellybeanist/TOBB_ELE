`timescale 1ns / 1ps


module test2(
        input btnC,btnD,btnU,btnR,btnL,
        input clk,
        output [6:0] seg ,
        output[3:0] an, 
        output reg dp = 1'b1
    );
    wire flagC, flagD, flagU, flagR, flagL;
    //button logic
    buttonResponse b0(btnC, clk, flagC);
    buttonResponse b1(btnD, clk, flagD);
    buttonResponse b2(btnU, clk, flagU);
    buttonResponse b3(btnR, clk, flagR);
    buttonResponse b4(btnL, clk, flagL);
    
    reg [6:0] seg_r = 7'b1111101, seg_next;
    reg [3:0] an_r = 4'b0111, an_next;
    
    assign seg = seg_r;
    assign an = an_r;
    
    always @* begin
        seg_next = seg_r;
        an_next = an_r;
        if (flagC) begin
            if(seg_r ==  7'b1011111 || seg_r ==  7'b1101111) begin
                an_next = {an[0], an[3:1]};
            end
            if(seg_r == 7'b1011111 || seg_r == 7'b1111101 ) begin
                seg_next = 7'b1111110;
            end
            else if(seg_r == 7'b1101111 || seg_r == 7'b1111011 ) begin
                seg_next = 7'b1110111;
            end
            else if(seg_r == 7'b1111110 || seg_r == 7'b0111111 ) begin
                seg_next = 7'b1111101;
            end
            else if(seg_r == 7'b1110111) begin
                seg_next = 7'b1111011;
            end
        end
        else if (flagD) begin
            case (seg_r)
               7'b0111111: begin
                    seg_next = 7'b1111110;
               end
               7'b1111110: begin
                    seg_next = 7'b1110111;
               end
               7'b1111101: begin
                    seg_next = 7'b1111011;
               end
                7'b1011111: begin
                    seg_next = 7'b1101111;
                end
            endcase
        end
        else if(flagU) begin
            case (seg_r)
               7'b1111110: begin
                    seg_next = 7'b0111111;
               end
               7'b1110111: begin
                    seg_next = 7'b1111110;
               end
               7'b1111011: begin
                    seg_next = 7'b1111101;
               end
               7'b1101111: begin
                    seg_next = 7'b1011111;
               end
            endcase
        end
        else if(flagR) begin
            if(seg_r ==  7'b0111111 || seg_r ==  7'b1111110 || seg_r ==  7'b1110111 || seg_r ==  7'b1011111 || seg_r ==  7'b1101111) begin
                an_next = {an[0], an[3:1]};
            end
            if (seg_r ==  7'b1011111) begin
                seg_next =  7'b1111101 ;
            end
            else if (seg_r ==  7'b1101111 ) begin
                seg_next = 7'b1111011 ;
            end
            else if (seg_r ==  7'b1111101) begin
                seg_next =  7'b1011111 ;
            end
            else if (seg_r ==  7'b1111011 ) begin
                seg_next = 7'b1101111 ;
            end
        end
        else if(flagL) begin
            if(seg_r ==  7'b0111111 || seg_r ==  7'b1111110 || seg_r ==  7'b1110111 || seg_r ==  7'b1111011 || seg_r ==  7'b1111101) begin
                an_next = {an[2:0], an[3]}; 
            end
            if (seg_r ==  7'b1011111) begin
                seg_next =  7'b1111101 ;
            end
            else if (seg_r ==  7'b1101111 ) begin
                seg_next = 7'b1111011 ;
            end
            else if (seg_r ==  7'b1111101) begin
                seg_next =  7'b1011111 ;
            end
            else if (seg_r ==  7'b1111011 ) begin
                seg_next = 7'b1101111 ;
            end
        end
    end
    
    always @ (posedge clk) begin
        an_r <= an_next;
        seg_r <= seg_next;
    end
endmodule
