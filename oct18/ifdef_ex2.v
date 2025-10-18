//`define first_block
//`define second_nest
`define last_result
`define real_last
module test56;
    `ifdef first_block
        `ifndef second_nest
            initial $display("First_Block is defined.");
        `else
            initial $display("First_Block and Second_nest is defined");
     `endif 
    
    `elsif second_block
        initial $display("Second Block is defined not first");
    `else
        `ifndef last_result
            initial $display("First Block, second block, last result not defined");
        `elsif real_last
            initial $display("First Block, Second Block not defined, Last result and real_last defined");
        `else
            initial $dsiplay("Only last result defined");
         `endif
     `endif
endmodule
