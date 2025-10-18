`define max(a,b) ((a) > (b) ? (a) : (b))
module macro_module;
    reg [7:0] p, q, r, s, n;

    initial begin
        p = 16;
        q = 123;
        r = 12;
        s = 151;
        n = `max(p+q,r+s);
    end

    initial begin
        $monitor("Time: %g, P+Q: %d, R+S: %d, N: %d", $time, p+q, r+s, n);
    end
endmodule
