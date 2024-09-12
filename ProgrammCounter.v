module ProgrammCounter #(parameter nbit =32)(
    input clk,reset_n,
    input [nbit-1:0] PCin,
    output reg [nbit-1:0] PCout
);

    always @(posedge clk or negedge reset_n) begin
        if(~reset_n)//active low reset
        PCout <=32'd0;
        else
        PCout <= PCin;
    end
    
endmodule