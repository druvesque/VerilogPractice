module behave;
    reg[1:0]a, b;
    initial begin
        a = 1'b1;
        b = 1'b0;
    end

    initial 
        #50 a = 0;

    initial 
        #10 b = 1'b1;

    initial 
        #60 $finish;

    initial begin
        $monitor("Time: %t, A: %b, B: %b", $time, a, b);

        $dumpfile("wv.vcd");
        $dumpvars(0, behave);
    end

endmodule
