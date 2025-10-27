module nor_switch(out, a, b);
    input a, b;
    output out;
    wire w;

    supply0 gnd;
    supply1 vdd;

    pmos p1(w, vdd, a);
    pmos p2(out, w, b);
    nmos n1(out, gnd, a);
    nmos n2(out, gnd, b);
endmodule

module tb;
    reg a, b;
    wire out;

    nor_switch n1(out, a, b);

    initial begin
        #10 a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, Output: %b", $time, a, b, out);
        #100 $finish;
    end
endmodule
