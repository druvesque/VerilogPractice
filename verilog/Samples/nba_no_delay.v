module tb;
reg ain, bin;
reg clk = 1;

initial
    forever #10 clk = ~clk;

always @(negedge clk)
fork
    ain = 0;
    bin = ain + 1;
join

initial begin
    $monitor("Time: %t, ain: %b, bin: %b", $time, ain, bin);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #200;
    $finish;
end

endmodule
