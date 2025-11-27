module mux_4x1(
    input a, b, c, d,
    input [1:0] sel,
    output reg y
);

always @(a, b, c, d, sel)
begin
    case(sel)
        2'b00 : y = a;
        2'b01 : y = b;
        2'b10 : y = c;
        default y = 1; 
    endcase
end

endmodule

module tb;
    reg a, b, c, d;
    reg [1:0] sel;
    wire y;

    mux_4x1 m1(.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));

    initial begin
        a = 1; b = 0; c = 1; d = 1; sel = 2'b0x;
        #10 sel = 2'b10;
        #10 sel = 2'bx1;
        #10 sel = 2'b11;
        a = 0; b = 1; c = 0; d = 1;
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, C: %b, D: %b, Sel: %b, Output: %b", $time, a, b, c, d, sel, y);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end

endmodule
