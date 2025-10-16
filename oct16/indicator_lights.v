module indicator_lights(clk, reset, left, right, emergency, left_indicator, right_indicator);
    input clk, reset;
    input left, right, emergency;
    output reg left_indicator, right_indicator;

    reg [1:0] state, next_state; 

    parameter left_state = 2'b01, right_state = 2'b10, emergency_state = 2'b11, reset_state = 2'b00;

    always @(state, left, right, emergency)
    begin
        case(state)

            reset_state: begin
                if(emergency)
                    next_state = emergency_state;
                else if(left)                     // assuming hardware doesn't allow both the indicators to be pushed together
                    next_state = left_state;      // TODO: dhruv, refine the flow
                else if(right)
                    next_state = right_state;
                else
                    next_state = reset_state;
            end

            emergency_state: begin
                if({left, right, emergency} == 3'b100)
                    next_state = left_state;
                else if({left, right, emergency} == 3'b010)
                    next_state = right_state;
                else if({left, right, emergency} = 3'b000)
                    next_state = reset_state;
                else
                    next_state = emergency_state;
            end
            
            left_state: begin
                if({left, right, emergency} == 3'b010)
                    next_state = right_state;
                else if({left, right, emergency} == 3'b001)
                    next_state = emergency_state;
                else if({left, right, emergency} == 3'b000)
                    next_state = reset_state;
                else
                    next_state = left_state;
            end

            right_state: begin
                if({left, right, emergency} == 3'b100)
                    next_state = left_state;
                else if({left, right, emergency} == 3'b001)
                    next_state = emergency_state;
                else if({left, right, emergency} == 3'b000)
                    next_state = reset_state;
            end
        endcase
    end


endmodule
