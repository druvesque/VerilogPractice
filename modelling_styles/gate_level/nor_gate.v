module nor_gate(o, a, b);
    input a, b;
    output o;

    nor n1(o, a, b);
endmodule

module tb;
    reg a, b;
    wire o;
    nor_gate nor1(.o(o), .a(a), .b(b));

    initial begin
        a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b0; b = 1'bx; 
        #10 a = 1'b0; b = 1'bz;

        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
        #10 a = 1'b1; b = 1'bx; 
        #10 a = 1'b1; b = 1'bz;

        #10 a = 1'bx; b = 1'b0;
        #10 a = 1'bx; b = 1'b1;
        #10 a = 1'bx; b = 1'bx; 
        #10 a = 1'bx; b = 1'bz;

        #10 a = 1'bz; b = 1'b0;
        #10 a = 1'bz; b = 1'b1;
        #10 a = 1'bz; b = 1'bx; 
        #10 a = 1'bz; b = 1'bz;
    end

    initial begin
        $monitor("Time: %t, A: %b, B: %b, Output: %b", $time, a, b, o);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule


