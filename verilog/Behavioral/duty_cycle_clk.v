module clk_gen(output reg clk);
    initial
        clk = 0;
    parameter on_cycle = 10;
    parameter off_cycle = 5;
    always 
    begin
        #off_cycle clk = 1'b1;
        #on_cycle clk = 1'b0;
    end

    initial begin
        $dumpfile("wv.vcd");
        $dumpvars(0, clk_gen);

        #200;
        $finish;
    end
endmodule
