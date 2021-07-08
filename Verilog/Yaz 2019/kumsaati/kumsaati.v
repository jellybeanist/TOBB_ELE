`timescale 1ns / 1ps

module kumsaati #(parameter C=4, A=0, N=2)(
    input btn, clk,
    output [3:0] an,
    output dp,
    output [7:0] led_left, led_right,
    output [6:0] seg
    );

    localparam LEFT = 1'b0;
    localparam RIGHT = 1'b1;

    reg [3:0] r_an = 4'b1110, r_an_next;
    reg [3:0] r_bcd = 4'd0;
    reg [31:0] r_counter = 32'd0, r_counter_next;
    reg [3:0] r_counter_right = A == RIGHT ? 4'd0 : C, r_counter_right_next;
    reg [17:0] r_counter_an = 18'd0, r_counter_an_next;
    reg [26:0] r_counter_sec = 27'd0, r_counter_sec_next;
    reg r_flow = A, r_flow_next;
    reg [7:0] r_left = A == LEFT ? 8'd0 : {C{1'b1}}, r_left_next;
    reg [7:0] r_right = A == LEFT ? {{8{1'b1}} << (8-C)} : 8'd0, r_right_next;
    reg [6:0] r_second = C * N, r_second_next;
    
    wire flag_btn;
    
    BCDto7SD (r_bcd, seg);
    buttonResponse(btn, clk, flag_btn);
    
    always @* begin
        r_an_next = r_an;
        r_counter_next = r_counter + 1'b1;
        r_counter_an_next = r_counter_an + 1'b1;
        r_counter_sec_next = r_counter_sec + 1'b1;
        r_counter_right_next = r_counter_right;
        r_flow_next = r_flow;
        r_left_next = r_left;
        r_right_next = r_right;
        r_second_next = r_second;
        
        if (r_counter_an == 18'd249_999) begin
            r_counter_an_next = 18'd0;
            r_an_next = {r_an[2:0], r_an[3]};
        end
        
        if (r_counter_sec_next == 27'd99_999_999) begin
            r_counter_sec_next = 27'd0;
            if (r_second != 7'd0) begin
                r_second_next = r_second - 1'b1;
            end
        end
        
        if (r_counter == 100_000_000 * N - 1) begin
            r_counter_next = 32'd0;
            if (r_flow == RIGHT) begin
                if (r_right[C-1] != 1'b1) begin
                    r_counter_right_next = r_counter_right + 1'b1;
                    r_left_next = r_left >> 1'b1;
                    r_right_next = {r_right, 1'b1};                    
                end
            end
            else begin
                if (r_left[8-C] != 1'b1) begin
                    r_counter_right_next = r_counter_right - 1'b1;
                    r_left_next = (r_left >> 1'b1) | 8'b1000_0000;
                    r_right_next = r_right << 1'b1;
                end
            end
        end
        
        case (r_an) 
            4'b1110: r_bcd = r_second % 10;
            4'b1101: r_bcd = (r_second / 10) % 10;
            4'b1011: r_bcd = r_second / 100;
            4'b0111: r_bcd = 4'd0;
        endcase
        
        if (flag_btn) begin
            r_counter_next = 32'd0;
            r_counter_sec_next = 27'd0;
            r_flow_next = ~r_flow;
            if (r_flow == RIGHT) begin
                r_second_next = r_counter_right * N;
            end
            else begin
                r_second_next = (C - r_counter_right) * N;
            end
            r_left_next = {<<{r_left}};
            r_right_next = {<<{r_right}};
        end
    end
    
    always @(posedge clk) begin
        r_an <= r_an_next;
        r_counter <= r_counter_next;
        r_counter_an <= r_counter_an_next;
        r_counter_sec <= r_counter_sec_next;
        r_counter_right <= r_counter_right_next;
        r_flow <= r_flow_next;
        r_left <= r_left_next;
        r_right <= r_right_next;
        r_second <= r_second_next;
    end
    
    assign an = r_an;
    assign dp = 1'b1;
    assign led_left = r_left;
    assign led_right = r_right;
endmodule
