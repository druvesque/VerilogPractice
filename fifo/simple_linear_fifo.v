module linear_simple_fifo( 
                           input clk,
                           input rst,
                           input [3:0] data_in,
                           input write_en,
                           input read_en,
                           output reg [3:0] data_out,
                           output reg empty,
                           output reg full
                         );

    reg [3:0] memory [7:0];
    reg [3:0] write_ptr, rd_ptr;
    integer i;

    always @(posedge clk) begin: fifo_rw

        if (!rst) begin
            for (i = 0; i < 8; i = i+1) begin
                memory[i] <= 4'b0000;
            end
            write_ptr = 0;
            read_ptr = 0;
        end

        else if(write_en && !full) begin
            memory[write_ptr] = data_in;
            write_ptr = write_ptr + 1;
            full = (write_ptr >= 7) ? 1 : 0;
        end

        else if(read_en && !empty) begin
            data_out = memory[read_ptr];
            read_ptr = read_ptr + 1;
            empty = (write_ptr == read_ptr);
        end
        
    end: fifo_rw

    always @(posedge clk) begin: empty_full

        if (wri
    end: empty_full

endmodule
