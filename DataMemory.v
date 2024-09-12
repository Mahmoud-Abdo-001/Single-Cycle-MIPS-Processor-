/*
In a standard single-cycle MIPS processor, 
the data memory usually does not read and write simultaneously. 
It performs one operation per clock cycle, 
either reading data from memory or writing data to memory, 
depending on the control signals.
*/
module DataMemory #(parameter nbits = 32)(
    input clk, we,
    input [nbits-1:0] A, WD,
    output reg [nbits-1:0] RD, 
    output [nbits-1:0] test_valu
);

reg [nbits-1:0] RAM [255:0];

always @(*) begin
    if (!we)
        RD = RAM[A[7:0]]; 
end

always @(posedge clk) begin
    if (we) begin
        RAM[A[7:0]] <= WD;
    end
end

assign test_valu = RAM[84];

endmodule
