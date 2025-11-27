module d_async(d, set, rst, clk, q, q_bar);
input d, set, rst, clk;
output reg q, q_bar;

always @(posedge clk, negedge rst, negedge set)
begin
    if(!set) begin
        q <= #4 1'b1;
        q_bar <= #3 1'b0;
    end
    else if(!rst) begin
        q <= #4 1'b0;
        q_bar <= #3 1'b1;
    end
    else 
    begin
        q <= #4 d;
        q_bar <= #3 ~d;
    end
end
endmodule

module tb;
reg d, set, rst;
reg clk = 0;
wire q, q_bar;
d_async d1(d, set, rst, clk, q, q_bar);

initial 
    forever #5 clk = ~clk;

initial begin
    #20 set = 0;
    #20 set = 1;
    #20 rst = 0;
    #20 rst = 1;
    #20 d = 1;
    #20 d = 0;
end

initial begin
    $dumpfile("wv.vcd");
    $dumpvars(0, tb);
    #200;
    $finish;
end
endmodule
