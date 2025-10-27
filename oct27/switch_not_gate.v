module not_switch(out, in);
    output out;
    input in;

    supply1 vdd;
    supply0 gnd;

    pmos p1(out, vdd, in);
    nmos n1(out, gnd, in);
endmodule

module tb;
    reg in;
    wire out;

    not_switch n1(out, in);

    initial begin
        #10 in = 1;
        #10 in = 0;
    end

    initial begin
        $monitor("Time: %g, In: %b, Out: %b", $time, in, out);
        #50 $finish;
    end
endmodule
