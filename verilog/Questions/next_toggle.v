module next_toggle(
    input [1:0] toggle,
    output reg [1:0] next
);

always @(toggle)
begin
    case(toggle)
        2'b10: next = 2'b01;
        2'b01: next = 2'b10;
    endcase
end

endmodule

module tb;
    reg [1:0] toggle;
    wire [1:0] next;
    next_toggle n1(.toggle(toggle), .next(next));

    initial begin
        toggle = 2'b00; 
        #10 toggle = 2'b01; 
        #10 toggle = 2'b10;
        #10 toggle = 2'b11;
    end

    initial begin
        $monitor("Time: %g, Toggle: %b, Next: %b", $time, toggle, next);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end

endmodule
