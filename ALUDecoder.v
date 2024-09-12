module ALUDecoder(
    input [5:0]Funct,   //  instr[5:0]
    input [1:0]ALUOp,
    output reg [2:0] ALUControl
);

always @(*) begin
    case(ALUOp)
        2'b00: ALUControl = 3'b010;  // ADD 
        2'b01: ALUControl = 3'b100;  // SUBTRACT 
        2'b10: begin
            case(Funct)
                6'b100_000: ALUControl = 3'b010; // ADD 
                6'b100_010: ALUControl = 3'b110; // SUBTRACT 
                6'b100_100: ALUControl = 3'b000; // AND 
                6'b100_101: ALUControl = 3'b001; // OR 
                6'b101_010: ALUControl = 3'b111; // SLT 
                default:   ALUControl = 3'bXXX; 
            endcase
        end
        default: ALUControl = 3'bXXX; 
    endcase
end
endmodule
