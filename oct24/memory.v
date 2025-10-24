module memoryh;
    reg [7:0] mem_data[1:256];

    initial
        $readmemh("testcase.txt", mem_data);

    initial
        $readmemh("testcase.txt", mem_data, 37);

    initial
        $readmemh("testcase.txt", mem_data, 124, 111);

endmodule
