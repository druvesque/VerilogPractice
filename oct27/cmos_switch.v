module cmos_switch(data, out, pctrl, nctrl);
    input data, pctrl, nctrl;
    output out;

    // syntax: name (drain, source, gate)
    pmos p1(out, data, pctrl);
    nmos p2(out, data, nctrl);
endmodule

module tb;
    reg data, pctrl, nctrl;
    wire out;

    cmos_switch c1(data, out, pctrl, nctrl);

    initial begin
        #10 pctrl = 1; nctrl = 1; data = 1;
    end

    initial begin
        $monitor("Time: %g, Data: %b, PCTRL: %b, NCTRL: %b Output: %b", $time, data, pctrl, nctrl, out);
        #200 $finish;
    end
endmodule
