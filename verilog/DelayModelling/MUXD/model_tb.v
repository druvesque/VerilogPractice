module mux8(in1, in2, s, q);
output [3:0] q;
input [3:0] in1, in2;
input s;

specify
    (in1 => q) = (3, 4);
    (in2 => q) = (2, 3);
    (s *> q) = 1;
endspecify

assign q = s ? in2:in1;
endmodule

module tb;
reg [3:0] in1, in2;
reg s;
wire [3:0] out;

mux8 m1(in1, in2, s, out);

initial begin
    s = 0; 
    #20 s = 1;
    #20 s = 0; 
    #20 s = 1;
    #20 s = 0; 
    #20 s = 1; 
    #20 s = 0;
    #20 s = 1;
    #20 s = 0;
    #20 s = 1;
    #20 s = 0;
    #20 s = 1;
end

initial begin
    #4 in1 = 4'b0000;
    in2 = 4'b0000;
    #4 in1 = 4'b0001;
    in2 = 4'b0100;
    #4 in1 = 4'b0110;
    in2 = 4'b1010;
    #4 in1 = 4'b0111;
    in2 = 4'b1111;
end

initial begin
    $monitor("Time: %t, In1: %b, In2: %b, S: %b, Out: %b", $time, in1, in2, s, out);

    $dumpfile("wv.vcd");
    $dumpvars(0, tb);

    #500;
    $finish;
end
endmodule
