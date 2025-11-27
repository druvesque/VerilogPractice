module tb;
    reg in, out;

    always @(in)
        out = #10 in;

    initial begin
        in = 1;
        #30 in = 0;
    end

    initial begin
        $monitor("Time: %g, input: %b, output: %b", $time, in, out);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #50;
        $finish;
    end
endmodule
