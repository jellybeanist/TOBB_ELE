`timescale 1ns / 1ps

module kayan_yazi(
    input btnC,
    input clk,
    output reg [6:0] seg,
    output reg dp = 1'b1,
    output reg [3:0] an = 4'b1111
    );
    wire idealBtnC;
    buttonResponse b0(.btn(btnC),
                      .clk(clk),
                      .flag(idealBtnC));
    
    localparam B = 7'b1100000;
    localparam I = 7'b1001111;
    localparam L = 7'b1110001;
    localparam TWO = 7'b0010010;
    localparam SIX = 7'b0100000;
    localparam FOUR = 7'b1001100;
    localparam A = 7'b0001000;                 
    reg[6:0] str_array [7:0];
    initial begin
        str_array[7] = B;
        str_array[6] = I;
        str_array[5] = L;
        str_array[4] = TWO;
        str_array[3] = SIX;
        str_array[2] = FOUR;
        str_array[1] = L;
        str_array[0] = A;
    end 
    
    reg [2:0] pointer = 3'd7, pointer_next = 3'd7;
    
    localparam SAG =1'b1, SOL=1'b0;
    
    reg state = SAG, state_next = SAG;
    always @(*) begin
        pointer_next = pointer;
        state_next = state;
        if (state == SAG)begin
            if(idealBtnC) state_next = SOL;
            pointer_next = pointer - 1'b1;
        end
        else begin
            if(idealBtnC) state_next = SAG;
            pointer_next = pointer + 1'b1; 
        end
    end
    
    reg [31:0] counter = 32'd0, counter2 = 32'd0;
    reg clk2 = 1'b0, clk3 = 1'b0;
    
    always @(posedge clk) begin
        state <= state_next;
        if (counter == 32'd10000000) begin //50000000 for 1s
            counter <= 32'd0;
            clk2 <= ~clk2;
        end
        else counter <= counter +1'b1;
        
        if (counter2 == 32'd200000) begin
            counter2 <= 32'd0;
            clk3 <= ~clk3;
        end
        else counter2 <= counter2 +1'b1;
    end
  
    always @(posedge clk2) begin
        pointer <= pointer_next;
    end
    
    always @(posedge clk3) begin
        case(an)
            4'b1110: begin seg <= str_array[pointer-2]; an <= 4'b1101; end
            4'b1101: begin seg <= str_array[pointer-1]; an <= 4'b1011; end
            4'b1011: begin seg <= str_array[pointer]; an <= 4'b0111; end
            default: begin seg <= str_array[pointer-3]; an <= 4'b1110; end
        endcase
    end
    
endmodule
