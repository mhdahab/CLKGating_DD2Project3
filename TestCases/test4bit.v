module test4bit(input [3:0]D_IN, input CLK,EN, output reg [3:0]D_OUT);
    always @(posedge CLK)
        begin
            if(EN)
                D_OUT<= D_IN;
        end
endmodule