module dff(q, d, clk);

input d, clk;
output reg q;

specify
    specparam tRise_clk_q = 150;
    specparam tFall_clk_q = 200;
    specparam tSetup = 70;
    (clk => q) = (tRise_clk_q, tFall_clk_q);
endspecify

always @(posedge clk)
    q<=d;
endmodule

module tb;

reg d;
reg clk = 0;
wire q;

dff dut(q, d, clk);
always #15 clk =~ clk;
initial begin
    #5 d = 0;
    #30 d = 1;
    #30 d = 0;
    #30 d = 1;
end

initial begin
    $monitor("Time: %t, D: %b, Q: %b", $time, d, q);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #200;
    $finish;
end
endmodule
