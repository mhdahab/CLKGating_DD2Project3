To run the code, open the command prompt from the file that contains the needed verilog files. In the command prompt, write the command (python GatingDD2.py -(clock_name) testcase_filename.v


In the function collectwires, we read the input file name and if the nor is found, we search for the inputs and erase them, and the same applies for the aoi. In the clkgating function, we the four counters are intiazlized as 0 and we read the input file line by line and if the mux is found, we search for the bracket [ and reg is turned to true, otherwise, the unique counter is incremented by 1. Then if the aoi is found, we recall collectwires function and remove nor and the createinverter counter is iincremented by1. 
for the inputfile itself, we replace the .gl.v by gated.v and write the headers "`include \"primitives.v" and "`include \"sky130_hd.v\". then ud the counter unique is zero or reg is true, we increment unique by one. after that, we make 2 copies of the unique one for the wire count and the other fpor the lock printing and we give create inverter to print inverter. then the input file is read line by line and check if the remove nor is true and there is a moodule, we write the line in the output file, then we write the wires and clock and decrement the number of wires by 1. Then if the wire id found, we delete it then we check if the wire is present in the wire list. if not, we write it in the file, and if found create inverter, then we write the inverter gate in the gated file. Then if the a21oi is found, we delete the A2 and create tthe inverter, then increment sky by 1. Then we write the clock in the file as well as the GCLK, CLK, and GATE. Then if a flip-flop is found, we delete the Q. if found and the D if found.  Then if the gclk is found,we pop it from the list. And if a module is found, we print it in the output file. And decrement the number of wires. And write the wire in the output file.  If a mux is found, and A1 is also found, we delete it. Then there is a loop for the last three letters in the line to add and we modify it in the variable (mod_string). Then we add the mod string the output file along with each function's input, output, and clock. The clock name is entered from the user in the command prompt.
 
problems: the test bench doesn't give the right output as the clock doesn't wave. 
