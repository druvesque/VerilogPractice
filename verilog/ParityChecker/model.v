module parity_checker #(parameter size = 32) (parity_bit, data);
output parity_bit;
input [size - 1:0] data;

assign parity_bit = ^data; //continous xor-ing
endmodule
