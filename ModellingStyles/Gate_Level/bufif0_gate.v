module bufif0_gate(o, a, enable);
    input a, enable;
    output o;

    bufif0 b1(o, a, enable);
endmodule

module tb;
    reg a, enable;
    wire o;
    bufif0_gate bufif0_1(.o(o), .a(a), .enable(enable));

    initial begin
        enable = 1'b0; a = 1'b0;
        #10 enable = 1'b0; a = 1'b1;
        #10 enable = 1'b0; a = 1'bx; 
        #10 enable = 1'b0; a = 1'bz;

        #10 enable = 1'b1; a = 1'b0;
        #10 enable = 1'b1; a = 1'b1;
        #10 enable = 1'b1; a = 1'bx; 
        #10 enable = 1'b1; a = 1'bz;

        #10 enable = 1'bx; a = 1'b0;
        #10 enable = 1'bx; a = 1'b1;
        #10 enable = 1'bx; a = 1'bx; 
        #10 enable = 1'bx; a = 1'bz;

        #10 enable = 1'bz; a = 1'b0;
        #10 enable = 1'bz; a = 1'b1;
        #10 enable = 1'bz; a = 1'bx; 
        #10 enable = 1'bz; a = 1'bz;
    end

    initial begin
        $monitor("Time: %t, A: %b, Enable: %b, Output: %b", $time, a, enable, o);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule

