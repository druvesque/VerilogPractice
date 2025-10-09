module tb;
    reg [3:0] a, b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;
    ripple_carry_adder_4_bit r1(a, b, c_in, sum, c_out);

    initial begin
        a = 5; b = 7; c_in = 0;
        #10 a = 9; b = 9; c_in = 0;
        #10 a = 10; b = 5; c_in = 1;
    end

    initial begin
        $monitor("Time: %g, A: %d, B: %d, C_in: %b, Sum: %d, C_out: %b", $time, a, b, c_in, sum, c_out);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200 $finish;
    end
endmodule 
