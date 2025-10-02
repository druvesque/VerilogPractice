module tb;
    reg a, b, c_in;
    wire sum, c_out;
    full_adder fa(sum, c_out, a, b, c_in);

    initial begin
        a = 1'b0; b = 1'b0; c_in = 1'b0;
        #10 a = 1'b0; b = 1'b0; c_in = 1'b0;
        #10 a = 1'b0; b = 1'b0; c_in = 1'b1;
        #10 a = 1'b0; b = 1'b1; c_in = 1'b0;
        #10 a = 1'b0; b = 1'b1; c_in = 1'b1;
        #10 a = 1'b1; b = 1'b0; c_in = 1'b0;
        #10 a = 1'b1; b = 1'b0; c_in = 1'b1;
        #10 a = 1'b1; b = 1'b1; c_in = 1'b0;        
        #10 a = 1'b1; b = 1'b1; c_in = 1'b1; 
    end

    initial begin
        $monitor("Time: %g, A: %b, B: %b, C_in: %b, Sum: %b, Carry: %b", $time, a, b, c_in, sum, c_out);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule
