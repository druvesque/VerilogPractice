module tb123;
    integer x;

    initial begin
        //$monitor("1####%g, %d", $time, x);
        //$strobe("1@@@@%g, %d", $time, x);

        //x <= 10;
        //$monitor("2####%g, %d", $time, x);
        //$strobe("2@@@@%g, %d", $time, x);

        //x <= 12;
        //$monitor("3####%g, %d", $time, x);
        //$strobe("3@@@@%g, %d", $time, x);

        //x <= 15;
        //$monitor("4####%g, %d", $time, x);
        //$strobe("4@@@@%g, %d", $time, x);

        //x <= 19;
        //$display("BIG-D****%g, %d", $time, x); //firstly work due to active region

        x = 10;
        #10 x = x+1;
        //$display("BIG-O****%g, %d", $time, x);
        $monitor("5####%g, %d", $time, x);
        $strobe("@@@@%g, %d", $time, x);

        #10 x = x+5;
        //$display("****%g, %d", $time, x);
    end
endmodule
