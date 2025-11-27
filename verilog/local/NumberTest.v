module NumberTest;

reg [11:0] a = 8'shA6;  initial $displayb("a = ", a);  
reg [11:0] b = 8'sh6A;  initial $displayb("b = ", b);
reg [11:0] c = 'shA6;   initial $displayb("c = ", c);
reg [11:0] d = 'sh6A;   initial $displayb("d = ", d);
reg [11:0] e = -8'shA6; initial $displayb("e = ", e);
reg [11:0] f = -'shA6;  initial $displayb("f = ", f);
reg [11:0] g = 9'shA6;  initial $displayb("g = ", g);
reg [11:0] i = -9'shA6; initial $displayb("i = ", i);
reg [11:0] j = -9'sh6A; initial $displayb("j = ", j);
reg [11:0] k = 4692;    initial $displayb("k = ", k);

endmodule
