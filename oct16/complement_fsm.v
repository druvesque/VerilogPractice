module complement_fsm(y, x, clk, reset);
    input x, clk, reset;
    output reg y;
    reg [1:0] state;
    reg [1:0] next_state; 

    parameter A = 2'b00, B = 2'b01, C = 2'b10;

    always @(x, state) begin
        case(state)
            A: begin next_state = B; y = 0; end
            B: begin next_state = C; y = 0; end
            C: begin next_state = C; y = x ? 0 : 1; end
        endcase
    end

    always @(posedge clk) begin
        if (!reset)
            state <= A; 
        else
            state <= next_state;
    end
endmodule

module tb;
    reg clk = 0; 
    reg x, reset;
    wire y;

    complement_fsm f1(.y(y), .x(x), .clk(clk), .reset(reset));

    initial
        forever #5 clk = ~clk;

    initial begin
        #1 reset = 0;
        #10 reset = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0; 
        #10 x = 0; 
        #10 x = 0;
    end

    initial begin
        $monitor("Time: %g, X: %b, Y: %b", $time, x, y);
        #200 $finish;
    end
endmodule
