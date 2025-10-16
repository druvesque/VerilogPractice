module alarm_clock(clk, reset, alarm, weekday, turn_off_alarm);
    input clk, reset;
    input alarm, weekday;
    output reg turn_off_alarm;

    reg [1:0] state, next_state;

    parameter asleep = 2'b00, awake_in_bed = 2'b01, awake_and_up = 2'b10;
    
    always @(state, alarm, weekday)
    begin
        case(state)
            asleep: begin
                next_state = (alarm) ? awake_in_bed : asleep;
                turn_off_alarm = (alarm) ? 1 : 0;
            end

            awake_in_bed: begin
                next_state = (alarm) ? awake_and_up : ((weekday) ? awake_and_up : asleep);
                turn_off_alarm = (alarm) ? 1 : 0;
            end

            awake_and_up: begin
                next_state = awake_and_up;
                turn_off_alarm = 0;
            end
        endcase
    end

    always @(posedge clk, negedge reset)
    begin
        if(!reset)
            state <= asleep;
        else
            state <= next_state;
    end
endmodule

module tb;
    reg clk = 0;
    reg alarm, weekday, reset;
    wire turn_off_alarm;

    alarm_clock a1(.clk(clk), .alarm(alarm), .weekday(weekday), .reset(reset), .turn_off_alarm(turn_off_alarm));

    initial 
        forever #10 clk = ~clk;

    initial begin
        reset = 0; 
        #6 reset = 1;
        #10 alarm = 1; weekday = 0; 
        #10 alarm = 1; weekday = 1;
    end

    initial begin
        $monitor("Time: %g, Alarm: %b, Weekday %b, Alarm_Off: %b", $time, alarm, weekday, turn_off_alarm);
        #200 $finish;
    end
endmodule
