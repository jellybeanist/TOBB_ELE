`timescale 1ns / 1ps

module BCDto7SD(
        input[3:0] bcd,
        output reg A, B, C, D, E, F, G,
        output DP
    );
    
    assign DP = 1'b0;
    
    always@* begin
        A = 1'b0; B = 1'b0;
        C = 1'b0; D = 1'b0;
        E = 1'b0; F = 1'b0;
        G = 1'b0;
        
        case(bcd)
            4'd0: begin
                A = 1'b1; B = 1'b1;
                C = 1'b1; D = 1'b1;
                E = 1'b1; F = 1'b1;
            end
            4'd1: begin
                B = 1'b1; C = 1'b1;
            end
            4'd2: begin
                A = 1'b1; B = 1'b1;
                G = 1'b1; E = 1'b1;
                D = 1'b1;
            end
            4'd3: begin
                A = 1'b1; B = 1'b1;
                G = 1'b1; C = 1'b1;
                D = 1'b1;
            end
            4'd4: begin
                F = 1'b1; G = 1'b1;
                B = 1'b1; C = 1'b1;
            end
            4'd5: begin
                A = 1'b1; F = 1'b1;
                G = 1'b1; C = 1'b1;
                D = 1'b1;
            end
            4'd6: begin
                A = 1'b1; F = 1'b1;
                G = 1'b1; E = 1'b1;
                C = 1'b1; D = 1'b1;
            end
            4'd7: begin
                A = 1'b1; B = 1'b1;
                C = 1'b1;
            end
            4'd8: begin
                A = 1'b1; B = 1'b1;
                C = 1'b1; D = 1'b1;
                E = 1'b1; F = 1'b1;
                G = 1'b1;
            end
            4'd9: begin
                A = 1'b1; B = 1'b1;
                F = 1'b1; G = 1'b1;
                C = 1'b1;
            end        
        endcase
    end
endmodule
