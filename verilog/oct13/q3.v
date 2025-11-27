module bit_counter(data, count);
    input [7:0] data;
    output [3:0] count;
    reg [3:0] count;

    always @(data) t(data, count);

    task t;
        input [7:0] a;
        output [3:0] c;
        reg [3:0] c;
        reg [7:0] temp;
        begin

        begin
            c = 0;
            temp = a;
            while(temp)
                begin
                    c = c+temp[0];
                    temp = temp >> 1;
                end
        end
        $display("C: %d", c);
        end
    endtask
endmodule

module tb;
    reg [7:0] data;
    wire [3:0] count;
    bit_counter b1(data, count);

    initial begin
        data = 8'b1000_1000; 
    end

    initial begin
        #20 $finish;
    end
endmodule
