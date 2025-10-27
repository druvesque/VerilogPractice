module tb;
    reg clk = 0;
    reg rst, write_en, read_en;
    reg [3:0] data_in;
    wire [3:0] data_out;
    wire empty, full;

    linear_simple_fifo f1(
                           .clk(clk),
                           .rst(rst),
                           .data_in(data_in),
                           .write_en(write_en),
                           .read_en(read_en),
                           .data_out(data_out),
                           .empty(empty),
                           .full(full)
                         );

    initial 
        forever #10 clk = ~clk;

    initial begin
    end

endmodule
