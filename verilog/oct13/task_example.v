module decl_task(cd_and, cd_or, cd_xor, c, d);
    output reg [3:0] cd_and, cd_or, cd_xor;
    input [3:0] c, d; 
    `include "../task.v"
    always @(c, d)
        operation(cd_and, cd_or, cd_xor, c, d);
endmodule

module tb;
    reg [3:0] c, d;
    wire [3:0] cd_and, cd_or, cd_xor;
    decl_task d1(cd_and, cd_or, cd_xor, c, d);

    initial begin
        c = 0; d = 0;
        #20 c = 0; d = 1;
        #20 c = 1; d = 0;
        #20 c = 1; d = 1;
    end

    initial begin
        $monitor("Time: %g, C: %b, D: %b, AND: %b, OR: %b, XOR: %b", $time, c, d, cd_and, cd_or, cd_xor);
        $dumpfile("wv.vcd");
        $dumpvars(0, tb);
        #100 $finish;
    end
endmodule
