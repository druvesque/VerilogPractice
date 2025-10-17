module event_example;
    reg clk, data_pkt;
    event data;
    reg [3:0] data_buf, data_rcvd;

    always @(posedge clk) begin
        if(data_pkt)
            ->data;
    end

    always @(data)
        data_buf = {data_rcvd[0], data_rcvd[1], data_rcvd[2], data_rcvd[3]};

    always #5 clk = ~clk;

    initial begin
        data_rcvd = 4'b1100; clk = 0;
        data_pkt = 1;
        #13 data_rcvd = 4'b0111;
        #10 data_rcvd = 4'b0001;
    end
endmodule

