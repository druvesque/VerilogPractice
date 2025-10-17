module test1;
    reg a, b, c, d;
    wire e;

    and a1(e, a, b, c);

    initial begin
        $monitor("%d, d = %b, e = %b", $time, d, e);
        a = 1;
        b = 0;
        c = 1;
        #10
        force d = (a | b | c);
        force e = (a | b | c);
        #10 $stop;
        release d;
        release e;
        #10 d = (a & b & c);
        #10 $finish;
    end
endmodule
