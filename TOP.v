module TOP (
    input clk ,reset_n,
    output [31:0] test_value_out
);


wire MemtoReg_w ,MemWrite_w,Branch_w,Jump_w,PCSrc_w , ALUSrc_w ,RegDst_w ,RegWrite_w   , Zero_w ;
wire [2:0] ALUControl_w ;
wire [31:0] instr_w,ALUResult_w , WriteData_W , ReadData_W , PC_w;


DataPath #(.nbit(32)) DataPath_U1(
    .clk(clk),
    .reset_n(reset_n),
    .MemtoReg(MemtoReg_w),
    .Jump(Jump_w),
    .PCSrc(PCSrc_w),
    .ALUControl(ALUControl_w),
    .ALUSrc(ALUSrc_w),
    .RegDst(RegDst_w),
    .RegWrite(RegWrite_w),
    .ReadData(ReadData_W),
    .WriteData(WriteData_W),//output
    .instr(instr_w),
    .PC(PC_w),//output
    .Zero(Zero_w),//output 
    .ALUResult(ALUResult_w) //output
    );

ControlUnit  ControlUnit_U1(
	.Opcode(instr_w[31:26]),
	.Funct(instr_w[5:0]),
	.MemtoReg(MemtoReg_w),
	.MemWrite(MemWrite_w),
	.Branch(Branch_w),
	.ALUControl(ALUControl_w),
	.ALUSrc(ALUSrc_w),
	.RegDst(RegDst_w),
	.RegWrite(RegWrite_w),
	.Jump(Jump_w)
	);


/*
Since your instruction memory has 256 locations, each 32-bit wide, 
you need to address 256 locations, which means you need 8 bits for addressing.
So, you should use the lower 8 bits of the PC output to address the instruction memory.
*/


InstructionMemory  #(.nbits(32)) InstructionMemory_U1(
	.A(PC_w[7:0]),
	.RD(instr_w)
	);
	
DataMemory  #(.nbits(32)) DataMemory_U1(
	.clk(clk),
	.we(MemWrite_w),
	.A(ALUResult_w),
	.WD(WriteData_W),
	.RD(ReadData_W), 
	.test_valu (test_value_out)
	);

assign PCSrc_w = Zero_w & Branch_w;
	
endmodule