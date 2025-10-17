module full_adder_gen(sum, c_out, a, b, c_in);
    parameter SIZE = 4;
    output [SIZE-1:0] sum;
    output c_out;
    input [SIZE-1:0] a, b;
    input c_in;

    wire [SIZE:0] c;
    wire [SIZE-1:0] t [1:3];

    genvar i;
    assign c[0] = c_in;

    generate for(i = 0; i<SIZE; i=i+1) begin
        xor g1(t[1][i], a[i], b[i]);
        xor g2(sum[i], t[1][i], c[i]);
        and g3(t[2][i], a[i], b[i]);
        and g4(t[3][i], t[1][i], c[i]);
        or g5(c[i+1], t[2][i], t[3][i]);
    end
    endgenerate

    assign c_out = c[SIZE];
endmodule

module tb;
    reg [3:0] a, b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;

    full_adder_gen #(.SIZE(4)) f1(.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));

    initial begin
        a = 7; b = 8; c_in = 0;
        #10 a = 9; b = 11; c_in = 1;
    end

    initial begin
        $monitor("Time: %g, A: %d, B: %d, C_in: %b, Sum: %d, C_out: %b", $time, a, b, c_in, sum, c_out);
        #200 $finish;
    end
endmodule
