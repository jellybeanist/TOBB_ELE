`timescale 1ns / 1ps


module test(
        input btnC,
        input clk,
        input [1:0] id,
        output [6:0] seg,
        output reg dp,
        output reg [3:0] an = 4'b1111,
        output [2:0]led
    );
    //button logic
    reg[10:0] pulses = 0, pulses_next = 0;
    reg button_in, button_in_prev;
    
    wire reset_pulses;
    wire end_counting_pulses;
    
    reg stable_signal = 0, stable_signal_prev = 0;
    
    always @(posedge clk) begin 
        button_in <= btnC;
        button_in_prev <= button_in;
        pulses <= pulses_next;
        stable_signal <= pulses[10] ? button_in_prev : stable_signal;
        stable_signal_prev <= stable_signal;
    end
    
    assign reset_pulses = (button_in ^ button_in_prev);
    assign end_counting_pulses = pulses[10];
    
     wire flag;
     assign flag = stable_signal && ~stable_signal_prev;
    
    always@* begin
        pulses_next = pulses;
        if(reset_pulses) pulses_next = 0;
        else if (~end_counting_pulses) pulses_next = pulses + 1; 
        
        
    end
    //button logic end
   
   // 2 sec clock
   reg clk2 = 0;
   reg [31:0]counter = 0;
   
   always @(posedge clk) begin
        if (counter == 32'd200000000) begin
            if (money < 5'b1010_0)
                    money <= money_next + 2'b1_0;
            //clk2 <= ~clk2;
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
            money <= money_next;
        end
        stock1 <= stock1_next;
        stock2 <= stock2_next;
        stock3 <= stock3_next;
        
   end
   // 2 sec clock end
   
   //an clock
   reg [19:0]counter2 = 0;
   reg clk3 = 0;
   always @(posedge clk) begin
         if (counter2 == 20'd250000) begin
              clk3 <= ~clk3;
              counter2 <= 0;
          end
          else begin
              counter2 <= counter2 + 1;
          end
          
   end
   //an clock end
   
   //otomat logic
   reg [4:0] stock1 = 5'd5, stock2 = 5'd15, stock3 = 5'd20 , stock1_next, stock2_next, stock3_next;
   reg [4:0] money = 0, money_next = 0/*, money_dec_next = 0, money_dec = 0*/; // xxxx_x last bit shows floting part
   assign led[2] = stock1 == 0 ? 1 : 0;
   assign led[1] = stock2 == 0 ? 1 : 0;
   assign led[0] = stock3 == 0 ? 1 : 0;
   
   /*always @(posedge clk2) begin
        
   end
   */
   always @* begin
        money_next = money;
        stock1_next = stock1;
        stock2_next = stock2;
        stock3_next = stock3;
        //money_dec_next = 0;
        if (flag) begin
            case(id)
                2'b00:begin
                    if(stock1 != 0 && money >= 5'b0001_1) begin
                        stock1_next = stock1 - 1;
                        money_next = money - 5'b0001_1;
                    end
                end
                2'b01: begin
                    if(stock2 != 0 && money >= 5'b0010_1) begin
                        stock2_next = stock2 - 1;
                        money_next = money - 5'b0010_1;
                    end 
                end
                2'b10: begin
                    if(stock3 != 0 && money >= 5'b0011_0) begin
                        stock3_next = stock3 - 1;
                        money_next = money - 5'b0011_0;
                    end 
                end
            endcase
        end
   end
   //otomat logic end
   
   //BCD logic
    reg [3:0]num = 0 ;
    assign seg[0]=~s0, seg[1]=~s1, seg[2]=~s2, seg[3]=~s3, seg[4]=~s4, seg[5]=~s5, seg[6]=~s6;
    BCDto7SD bcd(num, s0, s1, s2, s3, s4,s5,s6);
    
    always@(posedge clk3) begin
        case (an)
            4'b1011: begin  num<= money[0] ? 4'd5 : 0; dp<=1; an <= 4'b1110; end
            4'b1110: begin  num<=money < 5'b1010_0 ? money[4:1] : 5'd0;dp <= 0; an <= 4'b1101; end
            4'b1101: begin num<= money[4] && money[2]; dp <=1; an <= 4'b1011; end
            default:  an <= 4'b1011;
        endcase
     end
     
endmodule
