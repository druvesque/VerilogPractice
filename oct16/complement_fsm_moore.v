module complement_fsm_moore(y, x, clk, reset);
    input x, reset, clk;
    output reg y;
    reg [1:0] state, next_state;

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

    always @(x, state) begin
        case(state)
            A: begin next_state = B; end
            B: begin next_state = C; end
            C: begin next_state = x ? C : D; end
            D: begin next_state = x ? C : D; end
        endcase
    end

    always @(posedge clk, negedge reset) begin
        if(!reset)
            state <= A;
        else
            state <= next_state;
    end

    always @(state)
    begin
        if(state == D)
            y = 1;
        else
            y = 0;
    end
endmodule

module tb;
    reg clk = 0;
    reg x, reset;
    wire y;

    complement_fsm_moore f1(.y(y), .x(x), .reset(reset), .clk(clk));

    initial 
        forever #5 clk = ~clk;

    initial begin 

    end

    initial begin
        $monitor("Time: %g, X: %b, Y; %b", $time, x, y);
    end
endmodule
