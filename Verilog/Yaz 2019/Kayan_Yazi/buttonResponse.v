`timescale 1ns / 1ps

module buttonResponse(
        input btn, clk,
        output flag
    );
    reg[10:0] pulses = 0, pulses_next = 0;
    reg button_in, button_in_prev;
    
    wire reset_pulses;
    wire end_counting_pulses;
    
    reg stable_signal = 0, stable_signal_prev = 0;
    
    always @(posedge clk) begin 
        button_in <= btn;
        button_in_prev <= button_in;
        pulses <= pulses_next;
        stable_signal <= pulses[10] ? button_in_prev : stable_signal;
        stable_signal_prev <= stable_signal;
    end
    
    assign reset_pulses = (button_in ^ button_in_prev);
    assign end_counting_pulses = pulses[10];
 
     assign flag = stable_signal && ~stable_signal_prev;
     
     always@* begin
             pulses_next = pulses;
             if(reset_pulses) pulses_next = 0;
         else if (~end_counting_pulses) pulses_next = pulses + 1;   
     end
     
endmodule
