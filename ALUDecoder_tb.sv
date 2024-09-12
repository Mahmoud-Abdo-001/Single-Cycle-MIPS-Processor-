module ALUDecoder_tb;
bit [5:0] Funct;
bit [1:0] ALUOp;
bit [2:0] ALUControl;

ALUDecoder DU(.*);

integer i;
initial begin
    Funct = 6'd0;
    ALUOp = 2'd0;
    #20;

    Funct = 6'd0;
    ALUOp = 2'b01;
    #20;

    Funct = 6'b100_000;
    ALUOp = 2'b10;
    #20;

    Funct = 6'b100_010;
    ALUOp = 2'b10;
    #20;

    Funct = 6'b100_100;
    ALUOp = 2'b10;
    #20;

    Funct = 6'b100_101;
    ALUOp = 2'b10;
    #20;

    Funct = 6'b101_010;
    ALUOp = 2'b10;
    #20;

    $stop;
end
endmodule