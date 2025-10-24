module tb;
    integer add1, add2, add3;
    initial begin
        add1 = $fopen("file1.out");
        add2 = $fopen("file2.out");
        add3 = $fopen("file3.out");
        $fclose(add1);
        $fclose(add2);
        $fclose(add3);
    end
endmodule
