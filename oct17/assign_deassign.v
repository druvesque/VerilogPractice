module dflop(preset, clear, q, clk, d);
    input preset, clear, clk, d;
    output reg q; //only on registers

    always @(clear, preset) begin
        if(!clear)
            #10 assign q = 0;
        else if(!preset)
            #10 assign q = 1;
        else
            #10 deassign q;
    end

    always @(negedge clk) begin
        #10 q <= d;
    end
endmodule

module tb;
    reg clk = 0;
    reg preset = 1;
    reg clear;
    reg d;
    wire q;

    dflop d1(preset, clear, q, clk, d);

    initial 
        forever #10 clk = ~clk;

    initial begin
        d = 1;
        clear = 0;
        #10 clear = 1;
        #10 d = 1'b0;
    end

    initial begin
        $monitor("Time: %g, D: %b, Q: %b", $time, d, q);
        #100 $finish;
    end
endmodule
