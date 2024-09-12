module ControlUnit(
    input [5:0]Opcode,Funct,
    output MemtoReg,MemWrite,Branch,
    output [2:0]ALUControl,
    output ALUSrc,RegDst,RegWrite,
    output Jump
);

wire [1:0] ALUOp_W;

MainDecoder MainDecoder_U1(
    .Opcode(Opcode),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUSrc(ALUSrc),
    .RegDst(RegDst),
    .RegWrite(RegWrite),
    .ALUOp(ALUOp_W),
	.Jump(Jump)
    );
	
ALUDecoder ALUDecoder_U1(
    .Funct(Funct),
    .ALUOp(ALUOp_W),
    .ALUControl(ALUControl)
    );
endmodule
