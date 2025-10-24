primitive mux_21_udp(out, sel, i0, i1);
    output out;
    input sel, i0, i1;
    table
        // sel i0 i1 out
        0 0 ? : 0; // 1
        0 1 ? : 1; // 2
        1 ? 0 : 0; // 3
        1 ? 1 : 1; // 4
        ? 0 0 : 0; // 5
        ? 1 1 : 1; // 6
    endtable
endprimitive

module tb;
    reg i0, i1, sel;
    wire out;
    mux_21_udp m1(out, sel, i0, i1);

    initial begin
        i0 = 0; i1 = 1;
    end

    initial begin
        $monitor("I0: %b, I1: %b, Sel: %b, Out: %b", i0, i1, sel, out);
        #100 $finish;
    end
endmodule
