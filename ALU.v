module ALU (
    input [31:0] srcA, srcB,
    input [2:0] ALUControl,
    output reg [31:0] ALUResult,
    output reg Zero
);

always @(*) begin 
    case (ALUControl)
        3'b000: ALUResult = srcA & srcB;       // AND
        3'b001: ALUResult = srcA | srcB;       // OR
        3'b010: ALUResult = srcA + srcB;       // ADD
        3'b110: ALUResult = srcA - srcB;       // SUBTRACT
        3'b111: ALUResult = (srcA < srcB)?1'b1:1'b0;     // SLT
        default: ALUResult = 32'b0;           
    endcase
end

// assign Zero = (ALUResult == 0);
always @(*) begin
    Zero = (ALUResult == 32'b0);
end

endmodule
