`timescale 1ns/1ps
module ControlUnit_tb;
bit [5:0] Funct;
bit [5:0] Opcode;
bit MemtoReg,MemWrite,Branch;
bit ALUSrc,RegDst,RegWrite;
bit [2:0] ALUControl;
bit Jump;

ControlUnit DUT (.*);

initial begin
    //case Opcode =6'd0   
    Opcode=6'b000_000; // GIVES ALUOp= 2'b10
    Funct=6'b100_000; // assert ADD
    #10;
    Opcode=6'd0; // GIVES ALUOp= 2'b10
    Funct=6'b100_010;  //assert SBTRACTION
    #10;
    Opcode=6'd0; // GIVES ALUOp= 2'b10
    Funct=6'b100_100; //assert And
    #10;
    Opcode=6'd0; // GIVES ALUOp= 2'b10
    Funct=6'b100_101; //assert OR
    #10;
    Opcode=6'd0; // GIVES ALUOp= 2'b10
    Funct=6'b101_010; //assert SLT
    #10;

    //case Opcode =6'b100_011   "LW"
    Opcode=6'b100_011;  //gives ALUOp = 2'b00
    Funct=6'b100_000; 
    #10;
    Opcode=6'b100_011; 
    Funct=6'b100_010;  
    #10;
    Opcode=6'b100_011; 
    Funct=6'b100_100; 
    #10;
    Opcode=6'b100_011; 
    Funct=6'b100_101; 
    #10;
    Opcode=6'b100_011; 
    Funct=6'b101_010; 
    #10;

    //case Opcode =6'b101_011  "SW"
    Opcode=6'b101_011; //gives ALUOp = 2'b00
    Funct=6'b101_000; 
    #10;
    Opcode=6'b101_011; 
    Funct=6'b100_010;  
    #10;
    Opcode=6'b101_011; 
    Funct=6'b100_100; 
    #10;
    Opcode=6'b101_011; 
    Funct=6'b100_101; 
    #10;
    Opcode=6'b101_011; 
    Funct=6'b101_010; 
    #10;

    //case Opcode =6'b000_100   "beq"
    Opcode=6'b000_100; //gives ALUOp = 2'b01
    Funct=6'b101_000; 
    #10;
    Opcode=6'b000_100; 
    Funct=6'b100_010;  
    #10;
    Opcode=6'b000_100; 
    Funct=6'b100_100; 
    #10;
    Opcode=6'b000_100; 
    Funct=6'b100_101; 
    #10;
    Opcode=6'b000_100; 
    Funct=6'b101_010; 
    #10;

    //case Opcode =6'b001_000  "addi"
    Opcode=6'b001_000; //gives ALUOp = 2'b00
    Funct=6'b101_000; 
    #10;
    Opcode=6'b001_000; 
    Funct=6'b100_010;  
    #10;
    Opcode=6'b001_000; 
    Funct=6'b100_100; 
    #10;
    Opcode=6'b001_000; 
    Funct=6'b100_101; 
    #10;
    Opcode=6'b001_000; 
    Funct=6'b101_010; 
    #10;

    //case Opcode =6'b000_010   "jump"
    Opcode=6'b000_010; //  assert JUMP
    Funct=6'b101_000; 
    #10;
    Opcode=6'b000_010; 
    Funct=6'b100_010;  
    #10;
    Opcode=6'b000_010; 
    Funct=6'b100_100; 
    #10;
    Opcode=6'b000_010; 
    Funct=6'b100_101; 
    #10;
    Opcode=6'b000_010; 
    Funct=6'b101_010; 
    #10;
    $stop;
end
endmodule