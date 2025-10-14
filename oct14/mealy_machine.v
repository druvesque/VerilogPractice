module mealy_machine(y, x, reset, clk);
    input x, clk, reset;
    output reg y;
    reg [1:0] state;
    reg [1:0] next_state;

    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;

    always @(x, state) begin
        case(state)
            A: begin next_state = x ? B : A; y = 0; end
            B: begin next_state = x ? D : A; y = x ? 0 : 1; end
            C: begin next_state = x ? C : A; y = x ? 0 : 1; end
            D: begin next_state = x ? C : A; y = x ? 0 : 1; end 
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

    mealy_machine m1(.y(y), .x(x), .reset(reset), .clk(clk));

    initial 
        forever #5 clk = ~clk;

    initial begin
        #1 reset = 0;
        #10 reset = 1;
        #1 x = 0;
        #8 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
    end

    initial begin
        $monitor("Time: %g, X: %b, Y: %b", $time, x, y);
        #200 $finish;
    end
endmodule 
