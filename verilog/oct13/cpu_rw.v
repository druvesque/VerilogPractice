module bus_rw_api();
    reg clk = 0;
    reg rd, wr, ce;
    reg [7:0] addr, data_wr, data_rd;
    reg [7:0] read_data;

    initial
        forever #1 clk = ~clk;

    initial begin
        rd = 0; wr = 0; ce = 0;
        read_data = 0; addr = 0;
        data_wr = 0; data_rd = 0;

        #1 cpu_write(8'h11, 8'hAA);
        #1 cpu_read(8'h11, read_data);
        #1 cpu_write(8'h12, 8'hAB);
        #1 cpu_read(8'h12, read_data);
        #1 cpu_write(8'h13, 8'h0A);
        #1 cpu_read(8'h13, read_data);

        #100 $finish;
    end

    task cpu_read;
        input [7:0] address;
        input [7:0] data;
        begin
            $display("Time: %g, Read Task with Address: %h", $time, address);
            $display("Time: %g, Driving CE, RD, Address on to bus", $time);

            @(posedge clk);
            addr = address;
            ce = 1;
            rd = 1;
            @(negedge clk);
            data = data_rd;
            @(posedge clk);
            addr = 0;
            ce = 0;
            rd = 0;

            $display("Time: %g, CPU Read Data: %h", $time, data);
            $display("==============================");
        end
    endtask

    task cpu_write;
        input [7:0] address;
        input [7:0] data;
        begin
            $display("Time: %g, CPU Write with address: %h, Data: %h", $time, address, data);
            $display("Time: %g, Driving CE, WR, Data and Address on to bus", $time);
            
            @(posedge clk);
            addr = address;
            ce = 1; wr = 1;
            data_wr = data;
            @(posedge clk);
            addr = 0; ce = 0; wr = 0;

            $display("======================================");
        end
    endtask

    // Memory Model
    reg [7:0] mem [0:255];
    always @(addr or ce or rd or wr or data_wr)
    begin
        if (ce) begin
            if (wr) begin
                mem[addr] = data_wr;
            end
            if (rd) begin
                data_rd = mem[addr];
            end
        end
    end
endmodule
