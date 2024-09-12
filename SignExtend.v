module SignExtend (
	input [15:0] in,
	output [31:0] signlmm
);
assign signlmm = {{16{in[15]}},in[15:0]};
endmodule