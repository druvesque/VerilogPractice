module sequence_detector(y, x, reset, clk);
    input x, reset, clk;
    output reg y;
    reg [2:0] state;
    reg [2:0] next_state;

    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;

    always @(x,state) begin
        case(state)
            A: begin next_state = x ? B : A; y = 0; end
            B: begin next_state = x ? C : A; y = 0; end
            C: begin next_state = x ? C : D; y = 0; end
            D: begin next_state = x ? E : A; y = 0; end
            E: begin next_state = x ? C : A; y = x ? 1 : 0; end
        endcase
    end

    always @(posedge clk) begin
        if(!reset) 
            state = A;
        else 
            state = next_state;
    end
endmodule

module tb;
    reg clk = 0;
    reg x, reset; 
    wire y;
    sequence_detector s1(.y(y), .x(x), .reset(reset), .clk(clk));

    initial 
        forever #5 clk = ~clk;

    initial begin
        #1 reset = 0; 
        #10 reset = 1;
        #1 x = 0;
        #8 x = 1; 
        #10 x = 1; 
        #10 x = 0; 
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
    end

    initial begin
        $monitor("Time: %g, Y: %b", $time, y);
        #200 $finish;
    end
endmodule
