`timescale 1ns / 1ps

module BCDto7SD(
    input [3:0] bcd,
    output reg [6:0] segment
    );
    
    localparam ZERO     = 7'b000_0001;
    localparam ONE      = 7'b100_1111;
    localparam TWO      = 7'b001_0010;
    localparam THREE    = 7'b000_0110;
    localparam FOUR     = 7'b100_1100;
    localparam FIVE     = 7'b010_0100;
    localparam SIX      = 7'b010_0000;
    localparam SEVEN    = 7'b000_1111;
    localparam EIGHT    = 7'b000_0000;
    localparam NINE     = 7'b000_0100;

    always @* begin
        case(bcd)
            4'd0: segment = ZERO;
            4'd1: segment = ONE;
            4'd2: segment = TWO;
            4'd3: segment = THREE;
            4'd4: segment = FOUR;
            4'd5: segment = FIVE;
            4'd6: segment = SIX;
            4'd7: segment = SEVEN;
            4'd8: segment = EIGHT;
            default: segment = NINE;
        endcase
    end
endmodule
