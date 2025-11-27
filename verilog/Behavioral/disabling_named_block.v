module tb;
    reg [9:0] flag;
    integer i;

    initial begin
        flag = 10'b 00_1100_0000;
        i = 0;
        begin: block1
            while(i<10)
            begin
                if (flag[i])
                begin
                    $display("Encountered TRUE bit at element number %d", i);
                    disable block1;
                end
                i = i+1;
            end
        end
    end
endmodule
