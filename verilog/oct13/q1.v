module wd_align(w_in, w_out);
    input [7:0] w_in;
    output [7:0] w_out;
    assign w_out = align(w_in);

    function [7:0] align;
        input [7:0] word;
        begin
            align = word;
            if(align!=0)
                while(align[7] == 0)
                    align = align << 1;

        end
    endfunction
endmodule

module tb;
    reg [7:0] w_in;
    wire [7:0] w_out;
    wd_align w1(w_in, w_out);

    initial begin
        w_in = 8'b1000_1000;
        #10 w_in = 8'b0101_0101;
        #10 w_in = 8'b0001_0001;
    end

    initial begin
        $monitor("W_in: %b, W_out: %b", w_in, w_out);
        $dumpfile("wv.vcd");
        $dumpvars(0, tb);
        #100 $finish;
    end
endmodule
