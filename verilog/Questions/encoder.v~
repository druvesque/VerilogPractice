module encoder(
    input [7:0] a,
    output reg [2:0] result
);

always @(a) 
begin
    case(a)
        8'b00000001: result = 3'b000;
        8'b00000010: result = 3'b001;
        8'b00000100: result = 3'b010;
        8'b00001000: result = 3'b011;
        8'b00010000: result = 3'b100;
        8'b00100000: result = 3'b101;
        8'b01000000: result = 3'b110;
        8'b10000000: result = 3'b111;

        default: result = 3'b111;
    endcase
end

endmodule

module tb;
    reg [7:0] a;
    wire [2:0] out;
    encoder e1(.a(a), .result(out));

    initial begin
        a = 8'b01010101; 
        #10 a = 8'b01000000;
        #20 a = 8'b00001000;
    end

    initial begin
        $monitor("Time: %g, Input: %b, Output: %b", $time, a, out);

        $dumpfile("wv.vcd");
        $dumpvars(0, tb);

        #200;
        $finish;
    end
endmodule
