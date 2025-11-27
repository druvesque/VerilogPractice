module hello_vlsi;
parameter count = 0;
initial begin
$display("Displaying hello vlsi id number = %d, Time: %t", count, $time);
end
endmodule

module top;

hello_vlsi w1(); 
hello_vlsi w2();
defparam w1.count = 1, w2.count = 2;

endmodule
