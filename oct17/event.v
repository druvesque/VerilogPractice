module tb;
    event e1, e2;
    initial begin
        $display("%d:1:before trigger", $time);
        ->e1;
        @e2;
        $display("%d:1:after trigger", $time);
    end

    initial begin
        $display("%d:2:before trigger", $time);
        ->e2;
        @e1;
        $display("%d:2:after trigger", $time);
    end
endmodule
