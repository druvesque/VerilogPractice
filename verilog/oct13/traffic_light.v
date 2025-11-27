module traffic_light;
    reg clk = 0;
    reg red, yellow, green;
    parameter on = 1, off = 0, red_tics = 35, yellow_tics = 10, green_tics = 20;

    initial begin
        red = off;
        yellow = off;
        green = off;
    end

    always begin
        red = on;
        light(red, red_tics);
        green = on;
        light(green, green_tics);
        yellow = on;
        light(yellow, yellow_tics);
    end

    initial 
        forever #100 clk = ~clk;
    task light;
        output color;
        input [31:0] tics;
        begin
            repeat(tics) @(posedge clk);
            color = off;
        end
    endtask

    initial begin
        #10000 $finish;
    end
endmodule
