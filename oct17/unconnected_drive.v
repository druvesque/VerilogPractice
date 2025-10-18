`unconnected_drive pull1
module my_and(y, a, b);
    output y;
    input a, b;

    assign y = a & b;
endmodule

module tb;
    reg b;
    wire y;
    my_and a1(y, ,b);

    initial begin
        b = 1;
        #10 b = 0;
    end

    initial begin
        $monitor("Time: %g, B: %b, Output: %b", $time, b, y);
        #100 $finish;
    end
endmodule
`nounconnected_drive
