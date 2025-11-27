module clock_generation(clk1, clk2, clk3);
    output reg clk1;
    output reg clk2 = 0;
    output reg clk3 = 0;

    // Always-Block
    initial 
        clk1 = 1'b0;
    always
        #10 clk1 = ~clk1;

    // Forever-Block
    initial 
        forever #10 clk2 = ~clk2;

    // !=50% DutyCycle Clock
    parameter on_cycle = 10;
    parameter off_cyle = 5;
    always 
    begin
        #on_cycle clk3 = 1'b1;
        #off_cycle clk3 = 1'b0;
    end

    initial begin
        $dumpfile("wv.vcd");
        $dumpvars(0, clock_generation);
    end


endmodule
