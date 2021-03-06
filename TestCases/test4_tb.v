`define FUNCTIONAL
`define UNIT_DELAY #1
module tb;
reg CLK,EN;
reg [3:0] D_IN;
wire [3:0] D_OUT;

test4bit x (D_IN,CLK,EN,D_OUT);

initial begin
$dumpfile("test_updated.vcd"); // vcd dump file
$dumpvars; // dump everything
end 

 initial begin 
	CLK = 0;
    forever begin
    #5
    CLK = ~CLK;
        end 
 end

initial begin
D_IN=4'd1;
EN=1'b1;
#10
if(D_OUT==4'b1)  
        $display("test correct");
else
         $display("test failed for input combination 11");
#10

D_IN=4'b0;
EN=1'b0;
#10
if(D_OUT==4'b1)  
        $display("test correct");
else
         $display("test failed for input combination 00");
#10

D_IN=4'b1;
EN=1'b0;
#10
if(D_OUT==4'b1)  
       $display("test correct");
else
        $display("test failed for input combination 10");
#10

D_IN=4'b0;
EN=1'b1;
#10
if(D_OUT==4'b0)  
       $display("test correct");
else
        $display("test failed for input combination 01");
#10 
D_IN=4'd3;
EN=1'b1;
#10
if(D_OUT==4'd3)  
       $display("test correct");
else
        $display("test failed for input combination 01");
#10
D_IN=4'd13;
EN=1'b0;
#10
if(D_OUT==4'd3)  
       $display("test correct");
else
        $display("test failed for input combination 01");
#10
D_IN=4'd13;
EN=1'b1;
#10
if(D_OUT==4'd13)  
       $display("test correct");
else
        $display("test failed for input combination 01");
#10
D_IN=4'd13;
EN=1'b1;
#10
if(D_OUT==4'd13)  
       $display("test correct");
else
        $display("test failed for input combination 01");#10
D_IN=4'd15;
EN=1'b1;
#10
if(D_OUT==4'd15)  
       $display("test correct");
else
        $display("test failed for input combination 01");
$finish;
end

endmodule