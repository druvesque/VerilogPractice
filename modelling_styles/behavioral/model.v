module clk;
    reg a;
    initial begin
        a = 0;

        $dumpfile("wv.vcd");
        $dumpvars(0, clk);

        #300;
        $finish;
    end

    always 
        #10 a = ~a;
endmodule
