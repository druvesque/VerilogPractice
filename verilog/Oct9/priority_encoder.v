module priority_encoder(i, o);
    input [7:0] i;
    output reg [2:0] o;
    
    always @(i)
    begin
    casex(i)
        8'b1xxxxxxx: o=3'b111;
        8'b01xxxxxx: o=3'b110;
        8'b001xxxxx: o=3'b101;
        8'b0001xxxx: o=3'b100;
        8'b00001xxx: o=3'b011;
        8'b000001xx: o=3'b010;
        8'b0000001x: o=3'b001;
        8'b00000001: o=3'b000;
        default: o=3'bxxx;
    endcase
end
endmodule

module tb;
    reg [7:0] i;
    wire [2:0] o;
    priority_encoder p1(.i(i), .o(o));

    initial begin
        #10 i = 8'b00000001;
        #10 i = 8'b00000000;
    end

initial begin
    $monitor("Time: %g, Input: %b, Output: %b", $time, i, o);
    $dumpfile("wv.vcd");
    $dumpvars(0, tb);
    #100;
    $finish;
end
endmodule
