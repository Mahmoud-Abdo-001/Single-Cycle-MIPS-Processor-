module MainDecoder(
    input [5:0] Opcode,   //instr[31:26]
    output reg MemtoReg,
    output reg MemWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
	output reg Jump,
    output reg [1:0]ALUOp
);

//all do not care conditions were initialized to zero.
always @(*) begin
    case(Opcode)
    6'b000_000:begin   // R-type  - instrcution
        RegWrite = 1'b1;
        RegDst = 1'b1;
        ALUSrc = 1'b0;
        Branch = 1'b0;
        MemWrite =1'b0;
        MemtoReg=1'b0;
        ALUOp = 2'b10;
        Jump = 1'b0;
    end
    6'b100_011:begin   // lw  -instrcution
        RegWrite = 1'b1;
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        Branch = 1'b0;
        MemWrite =1'b0;
        MemtoReg=1'b1;
        ALUOp = 2'b00;
        Jump = 1'b0;
    end
    6'b101_011:begin    //sw -instrcution 
        RegWrite = 1'b0;
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        Branch = 1'b0;
        MemWrite =1'b1;
        MemtoReg=1'b0;
        ALUOp = 2'b00;
        Jump = 1'b0;
    end
    6'b000_100:begin   // beq - instrcution
        RegWrite = 1'b0;
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        Branch = 1'b1;
        MemWrite =1'b0;
        MemtoReg=1'b0;
        ALUOp = 2'b01;
        Jump = 1'b0;
    end
    6'b001_000:begin   //addi -instrcution
        RegWrite = 1'b1;
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        Branch = 1'b0;
        MemWrite =1'b0;
        MemtoReg=1'b0;
        ALUOp = 2'b00;
        Jump = 1'b0;
    end
    6'b000_010:begin  // j - instrcution
        RegWrite = 1'b0;
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        Branch = 1'b0;
        MemWrite =1'b0;
        MemtoReg=1'b0;
        ALUOp = 2'b00;
        Jump = 1'b1;
    end
    default:begin
        RegWrite = 1'bx;
        RegDst = 1'bx;
        ALUSrc = 1'bx;
        Branch = 1'bx;
        MemWrite =1'bx;
        MemtoReg=1'bx;
        ALUOp = 2'bxx;
		Jump = 1'bx;
    end
    endcase
end
endmodule