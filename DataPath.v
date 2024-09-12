module  DataPath #(parameter nbit = 32)(
    input clk,reset_n, //active low reset
    input MemtoReg,Jump,PCSrc,
    input ALUSrc,RegDst,RegWrite,
	input [2:0]ALUControl,
    input [nbit-1:0] ReadData,instr,
    output [nbit-1:0] PC,ALUResult,WriteData,
    output Zero
);

wire [4:0] WriteReg;
wire [nbit-1:0] srcA, signlmm_out , ALUResult_W ,WriteData_W,PC_w, Result , PCPlus4 , PCBranch;
wire [nbit-1:0] shift_out1, mux_u4_out , mux_u5_out,PCJump , srcB_w;
wire [27:0] shift_out2;

Mux2x1 #(.nbit(5))mux_U1(
.a(instr[20:16]),
.b(instr[15:11]),
.sel(RegDst),
.c(WriteReg)
);

RegisterFile #(.nbits(32)) RegisterFile_U1(
.clk(clk),
.A1(instr[25:21]),
.A2(instr[20:16]),
.A3(WriteReg),
.wd3(Result),
.we3(RegWrite),
.RD1(srcA),
.RD2(WriteData_W)
);


SignExtend U3(
.in(instr[15:0]),
.signlmm(signlmm_out)
);


Mux2x1 #(.nbit(32)) mux_U2(
.sel(ALUSrc),
.a(WriteData_W),
.b(signlmm_out),
.c(srcB_w)
);

ALU alu_U1 (
.srcA(srcA),
.srcB(srcB_w),
.Zero(Zero),
.ALUControl(ALUControl),
.ALUResult(ALUResult_W)
);


Mux2x1 #(.nbit(32)) mux_U3 (
.a(ALUResult_W),
.b(ReadData),
.sel(MemtoReg),
.c(Result)
);


addr addr_U1(
.a(PC_w),
.b(32'h00000004),
.c(PCPlus4)
);


ShiftLeftBy2 #(.nbit_in(32),.nbit_out(32)) shifter_U1(
.in(signlmm_out),
.out(shift_out1)
);

addr addr_U2(
.a(shift_out1),
.b(PCPlus4),
.c(PCBranch)
);


ShiftLeftBy2 #(.nbit_in(26),.nbit_out(28)) shifter_U2(
.in(instr[25:0]),
.out(shift_out2)
);//done

Mux2x1 #(.nbit(32)) mux_U4(
.a(PCPlus4),
.b(PCBranch),
.sel(PCSrc),
.c(mux_u4_out)
);//done


Mux2x1 #(.nbit(32)) mux_U5(
.a(mux_u4_out),
.b(PCJump),
.sel(Jump),
.c(mux_u5_out)
); 

ProgrammCounter #(.nbit(32)) pc_U1(
.clk(clk),
.reset_n(reset_n),
.PCin(mux_u5_out),
.PCout(PC_w)
); 

assign PCJump = {PCPlus4[31:28],shift_out2};
assign WriteData = WriteData_W;
assign ALUResult = ALUResult_W;
assign PC = PC_w;

endmodule


