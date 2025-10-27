module nand_switch(y, a, b);
    output y;
    input a, b;

    supply0 gnd;
    supply1 vdd;
    wire w;

    pmos p1(y, vdd, a);
    pmos p2(y, vdd, b);
    nmos n1(w, gnd, b);
    nmos n2(y, w, a);
endmodule

module tb;
    reg a, b;
    wire y;

    nand_switch n1(y, a, b);

    initial begin
        #10 a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, Y: %b", $time, a, b, y);
        #100 $finish;
    end
endmodule
