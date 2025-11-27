module top;
    reg a, b;
    wire y;
    
    assign y = a;
    assign y = b;
    
    initial begin
    $monitor("Time: %t, A: %b, B: %b, Y: %b", $time, a, b, y);
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
        $dumpfile("wire_wv.vcd");
        $dumpvars(0, top);
    end

    initial begin
        #300;
        $finish;
    end
endmodule
