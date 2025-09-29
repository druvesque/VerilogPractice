module not_gate(o, a);
    input a;
    output o;

    not n1(o, a);
endmodule

module tb;
    reg a;
    wire o;
    not_gate not1(.o(o), .a(a));

    initial begin
        a = 1'b0;  
        #10 a = 1'b1;  
        #10 a = 1'bx; 
        #10 a = 1'bz;  
    end

    initial begin
        $monitor("Time: %t, A: %b, Output: %b", $time, a, o);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule


