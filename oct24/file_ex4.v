module dut(clk, enable, din, dout, valid);
    input wire clk;
    input enable;
    input wire [31:0] din;
    output reg [31:0] dout;
    output reg valid;

    always @(posedge clk)
    begin
        dout <= din + 1;
        valid <= enable;
    end
endmodule

module tb;
    integer in, out, mon;
    reg clk, enable;
    wire valid;
    reg [31:0] din, exp;
    wire [31:0] dout;
    integer statusI, statusO;

    dut dut1(clk, enable, din, dout, valid);

    initial begin
        clk = 0; enable = 0;
        din = 0; exp = 0;
        in = $fopen("input.txt", "r");
        out = $fopen("output.txt", "r");
        mon = $fopen("monitor.txt", "w");
    end

    always #1 clk = ~clk;

    initial begin
        repeat (10) @(posedge clk);
        while(!$feof(in)) begin
            @(negedge clk);
            enable = 1;
            statusI = $fscanf(in, "%h %h\n", din[31:16], din[15:0]);
            @(negedge clk);
            enable = 0;
        end

        repeat(10) @(posedge clk);
        $fclose(in);
        $fclose(out);
        $fclose(mon);
        #100 $finish;
    end

    always @(posedge clk)
        if(valid) begin
            $fwrite(mon, "%h %h\n", dout[31:16], dout[15:0]);
            statusO = $fscanf(out, "%h %h\n", exp[31:16], exp[15:0]);

            if(dout != exp) begin
                $display("%0dns error: input, output don't match", $time);
                $display(" got %h", dout);
                $display(" exp %h", exp);
            end

            else begin
                $display("%0dns match: input, output match", $time);
                $display(" got %h", dout);
                $display(" exp %h", exp);
            end
        end
endmodule
