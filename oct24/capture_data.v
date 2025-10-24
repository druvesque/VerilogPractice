`define NULL 0
`timescale 1 ns/ 1 ns
module tb;
    integer data_file, scan_file;
    reg [21:0] captured_data;

    reg clk = 0;

    initial 
        forever #10 clk = ~clk;

    initial begin
        data_file = $fopen("data_file.dat", "r");
        if (data_file == `NULL ) begin
            $display("data_file handle was NULL");
            $finish;
        end
    end

    always @(posedge clk) begin
        scan_file = $fscanf(data_file, "%d\n", captured_data);
        $display(captured_data);
    end

    initial begin
        #500 $finish;
    end

endmodule
