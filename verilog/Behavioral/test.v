module tb;
reg [15:0] data = 16'b 1111_1111_0000_0000;

reg clk = 0;
initial 
    forever #10 clk = ~clk;

always @(negedge clk)
begin
    data[15:8] <= data[7:0];
    data[7:0]  <= data[15:8];
end

initial begin
    $monitor("Time: %t, Data: %b", $time, data);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #300;
    $finish;
end
endmodule
