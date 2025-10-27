module nor3(out, a, b, c);
    input a, b, c;
    output out;

    supply0 gnd;

    nmos na(out, gnd, a), nb(out, gnd, b), nc(out, gnd, c);

    pullup(out);
endmodule

module tb;
    reg a, b, c;
    wire out;

    nor3 n1(out, a, b, c);
    initial begin
        a = 0; b = 0; c = 0;
        #10 a = 1; b = 0; c = 0;
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, C: %b, Output: %b", $time, a, b, c, out);
        #100 $finish;
    end
endmodule
