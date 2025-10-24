`timescale 1 ns/1 ns
module tb;
    reg in1;
    wire o1;
    integer file;
    buf #10 b1(o1, in1);

    initial begin
        file = $fopen("a1.dat");
        $fmonitor(file, "%m: %t in1 = %d, o1 = %h", $realtime, in1, o1);
        #10 in1 = 0;
        #10 in1 = 1;
        #20 $fclose(file);
    end
endmodule
