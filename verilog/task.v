// file task.v
task operation;
    output [3:0] ab_and, ab_or, ab_xor;
    input [3:0] a, b;
    begin
        #10 ab_and = a&b;
        ab_or = (a|b);
        ab_xor = a^b;
    end
endtask
