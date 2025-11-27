module setup_hold12(q, d, clock);
    input d, clock;
    output reg q;

    specify 
        (posedge clock => (q+:d)) = (10,8);
    endspecify

    always @(posedge clock)
        q <= d;
endmodule

module setup_hold12_tb;
    reg d;
    reg clock = 0;
    wire q; 

    setup_hold12 sh1(.q(q), .d(d), .clock(clock));
    initial 
        forever #7 clock = ~clock;

    initial begin
        d = 1'b0;
        #15 d = 1'b1;
        #17 d = 1'b0;
        #19 d = 1'b1;
        #15 d = 1'b0;
        #14 d = 1'b1;
    end

    initial begin
        $monitor("Time: %t, D: %b, Q: %b", $time, d, q);
        
        $dumpfile("wv.vcd");
        $dumpvars(0, setup_hold12_tb);

        #200;
        $finish;
    end
endmodule
