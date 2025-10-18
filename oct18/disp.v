module disp;
    reg [31:0] rval = 101;
    initial begin
        $display("RVAL = %h hex %d decimal", rval, rval);
        $display("RVAL = %o octal \n RVAl = %b bin", rval, rval);
        $display("RVAL has %c ASCII character value", rval);
        $display("Current Scope is %m");
        $display("%s in ASCII value for 101", 101);
        $display("simulation time is %g", $time);
    end
endmodule
