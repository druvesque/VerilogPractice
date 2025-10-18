`define behavioural
module and_op(a, b, c);
    output a;
    input b, c;
    `ifdef behavioural
        assign a = b | c;
    `else
        and a1(a, b, c);
    `endif
endmodule

module tb;
    reg b, c;
    wire a;

    and_op a1(.a(a), .b(b), .c(c));

    initial begin
        b = 1; c = 0;
    end

    initial begin
        $monitor("Time: %g, B: %b, C: %b, Output: %b", $time, b, c, a);
    end
endmodule
