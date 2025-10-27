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

module and4_switch(out, a, b, c, d);
    input a, b, c, d;
    output out;

    wire out_nand1, out_nand2;

    nand_switch n1(out_nand1, a, b);
    nand_switch n2(out_nand2, c, d);
    nor_switch n3(out, out_nand1, out_nand2);
endmodule

module tb;
    reg a, b, c, d;
    wire out;

    and4_switch a1(out, a, b, c, d);

    initial begin
        a = 1; b = 1; c = 1; d = 1;
        #10 a = 1; b = 1; c = 1; d = 0;
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, C: %b, D: %b, Output: %b", $time, a, b, c, d, out);
        #100 $finish;
        
    end
endmodule

