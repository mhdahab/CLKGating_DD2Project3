module test32bit(input [31:0]D_IN, input CLK,EN, output reg [31:0]D_OUT);
    always @(posedge CLK)
        begin
            if(EN)
                D_OUT<= D_IN;
        end
endmodule