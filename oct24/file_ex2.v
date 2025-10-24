`timescale 1 ns / 10 ps
`define EOF 32'hFFFF_FFFF
`define NULL 0
`define MAX_LINE_LENGTH 1000

module read_pattern1;

    integer file, c, r;
    reg [3:0] bin;
    reg [31:0] dec, hex;
    real real_time;
    reg [8*`MAX_LINE_LENGTH:0] line;

    initial begin: file_block
        $timeformat(-9, 2, "ns", 6);
        $display("time bin decimal hex");
        file = $fopen("data.txt", "r");

        if (file == `NULL)
            disable file_block;

        c = $fgetc(file);
        while (c != `EOF)
            begin
                if (c == "/") begin
                    r = $fgets(line, file);
                    // $display("%0s", line);
                    // $display("%b", r);
                end

                else begin
                    // Push the character to the file then read the next time
                    r = $ungetc(c, file);
                    r = $fscanf(file, "%g\n", real_time);

                    // Wait until the absolute time in the file, then read
                    // stimulus
                    
                    if ($realtime > real_time)
                        $display("Error - absolutetime in file is out of order - %t", real_time);

                        else
                            #(real_time - $realtime)
                                r = $fscanf(file, "%b %d %h\n", bin, dec, hex);
                        end // if c else
                    c = $fgetc(file);
                    // $display("%s", c);
            end // while not EOF

        $fclose(file);
    end: file_block // initial

    // Display changes to the signals
    always @(bin or dec or hex)
        $display("%g %3b %0d %3h", $realtime, bin, dec, hex);
endmodule
