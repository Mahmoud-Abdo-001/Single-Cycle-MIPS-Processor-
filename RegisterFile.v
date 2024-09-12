module RegisterFile #(parameter nbits =32)(
	input [4:0]A1,A2,A3, 
	input [nbits-1:0]wd3,
	input we3,clk,
	output  [nbits-1:0] RD1,RD2
);

reg [nbits-1:0] Registers [0:nbits-1];   // 32"depth" x 32"width" memory
	
assign   RD1 =Registers[A1];
assign   RD2 =Registers[A2];


always @(posedge clk)begin
    if (we3)
    Registers[A3]<=wd3;
	else Registers[A3] <= Registers[A3];
end

endmodule