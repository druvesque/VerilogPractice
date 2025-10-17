module dflop(preset, clear, q1, clk, d);
    input preset, clear, clk, d;
    output reg q1;

    always @(posedge clk, posedge preset, posedge clear) begin
        if(clear)
            q1 <= 0;
        else if(preset)
            q1 <= 1;
        else
            q1 <= d;
    end
endmodule

module test_dff;
    reg preset, clear, d;
    reg clk = 0;
    wire q;

    dflop dff(preset, clear, q, clk, d);

    initial 
        forever #3 clk = ~clk;

    initial begin
        force q = 0;
        preset = 1;
        #20
        preset = 0;
        release q;
        #20; 
        preset = 1;
    end

    initial begin
        d = 0;
    end

    initial begin
        $monitor("Time: %g, D: %b, Q: %b", $time, d, q);
        #100 $finish;
    end

endmodule
