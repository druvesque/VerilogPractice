module random_number_generator #(parameter seed=4'b0001) (random_number, clk, reset);
    output reg [3:0] random_number;
    input clk, reset;
    reg [4:0] im_data = seed;

    always @(posedge clk, negedge reset)
    begin
        if(!reset)
            im_data <= seed;
        else begin
            im_data <= {im_data[2:0], im_data[3] ^ im_data[2]};
            random_number <= im_data;
        end
    end
endmodule

module tb;
    reg reset;
    wire [3:0] random_number;
    reg clk = 0;
    random_number_generator r1(.random_number(random_number), .clk(clk), .reset(reset));

    initial 
        forever #10 clk = ~clk;

    initial begin
        #1 reset = 0;
        #10 reset = 1;
    end

    initial begin
        $monitor("Time: %g, Random_Number: %d", $time, random_number);
        $dumpfile("wv.vcd");
        $dumpvars(0, tb);
        #500;
        $finish;
    end
endmodule
