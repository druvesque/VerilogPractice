# VerilogPractice
My codes regarding my practice on the Hardware Descriptive &amp; RTL Design Language Verilog

These codes are written in a standardized manner. The rules are as follows:-

- Each Verilog file containing the design is named as model.v 
- Each Testbench file containing the tb is named as tb.v

- Currently, the simulator being used for the same is Icarus Verilog.
- The run command has been shortened in such a way that the it compiles the files first and loads it into a file named "dsn". 
- To command also ensures that the compiled design runs with vvp command. 
- All the codes dump their wavefiles in the format "wv.vcd", to ensure uniformity as the run command provides an option of providing an argument "-gtk" that will run GTKWave, to speed up the run process. 

