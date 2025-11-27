module adder #(parameter width = 10) (sum, c_out, a, b, c_in);
output [width - 1 : 0] sum;
output c_out;
input [width - 1 : 0] a, b;
input c_in;

assign {c_out, sum} = a + b + c_in;
endmodule
