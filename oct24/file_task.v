module tb;
    integer add1, add2, add3;
    integer desc1, desc2, desc3;

    initial begin
        add1 = $fopen("file1.out", "w");
        add2 = $fopen("file2.out", "w");
        add3 = $fopen("file3.out", "w");
        #5;
        desc1 = add1 | 1;
        $display("DESC1: %d", desc1);
        $fdisplay(desc1, "Display 1");
        desc2 = add2 | add1;
        $display("DESC2: %d", desc2);
        $fdisplay(desc2, "Display 2");
        desc3 = add3;
        $display("DESC3: %d", desc3);
        $fdisplay(desc3, "Display 3");
        #5;
        $fclose(add1);
        $fclose(add2);
        $fclose(add3);        
    end
endmodule
