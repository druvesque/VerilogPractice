module clkgen(output reg clock);

    initial 
        clock = 1'b0;

    initial 
        forever #20 clock = ~clock;

    initial begin
        $dumpfile("wv.vcd");
        $dumpvars(0, clkgen);

        #300; 
        $finish;
    end
endmodule
