// `timescale 1ns/1ps
// module DataPath_tb();
    // bit clk, reset, MemtoReg, Jump, PCSrc;
    // bit [2:0] ALUControl;
    // bit ALUSrc, RegDst, RegWrite;
    // bit [31:0] ReadData, instr;
    // wire [31:0] PC;
    // wire Zero;
    // wire [31:0] ALUResult, WriteData;

    // // Instantiate the DataPath
    // DataPath #(.nbit(32)) DUT (
        // .clk(clk),
        // .reset_n(reset),
        // .MemtoReg(MemtoReg),
        // .Jump(Jump),
        // .PCSrc(PCSrc),
        // .ALUControl(ALUControl),
        // .ALUSrc(ALUSrc),
        // .RegDst(RegDst),
        // .RegWrite(RegWrite),
        // .ReadData(ReadData),
        // .instr(instr),
        // .PC(PC),
        // .Zero(Zero),
        // .ALUResult(ALUResult),
        // .WriteData(WriteData)
    // );

    // // Clock generation
    // initial begin
        // clk = 0;
        // forever #5 clk = ~clk;
    // end
	
	
    

    // // Test sequence
    // initial begin
        // // Initial reset
        // reset = 0;
        // #10;
        // reset = 1;
        
        // // Test Case 1: Load instruction, ADD operation
        // instr = 32'b000000_00001_00010_00011_00000_100000; // R-type ADD
        // ALUControl = 3'b010; // ADD
        // RegDst = 1;
        // ALUSrc = 0;
        // RegWrite = 1;
        // MemtoReg = 0;
        // PCSrc = 0;
        // Jump = 0;
        // ReadData = 32'h00000000;
        // #10;

        // // Test Case 2: Load instruction, SUB operation
        // instr = 32'b000000_00001_00010_00011_00000_100010; // R-type SUB
        // ALUControl = 3'b110; // SUB
        // #10;

        // // Test Case 3: Load instruction, AND operation
        // instr = 32'b000000_00001_00010_00011_00000_100100; // R-type AND
        // ALUControl = 3'b000; // AND
        // #10;
		
		// @(negedge clk);
		// // Test Case 4: Load instruction, OR operation
		// instr = 32'b000000_00001_00010_00011_00000_100101; // R-type OR
		// ALUControl = 3'b001; // OR
		// RegDst = 1;
		// ALUSrc = 0;
		// RegWrite = 1;
		// MemtoReg = 0;
		// PCSrc = 0;
		// Jump = 0;
		// ReadData = 32'h00000000;
		// #10;
		// @(negedge clk);
		// // Test Case 5: Load instruction, SLT operation
		// instr = 32'b000000_00001_00010_00011_00000_101010; // R-type SLT
		// ALUControl = 3'b111; // SLT
		// RegDst = 1;
		// ALUSrc = 0;
		// RegWrite = 1;
		// MemtoReg = 0;
		// PCSrc = 0;
		// Jump = 0;
		// ReadData = 32'h00000000;
		// #10;
		
		// // Test Case 6: Load instruction, LW operation
		// instr = 32'b100011_00001_00010_0000000000000000; // LW instruction // LW instruction
		// ALUControl = 3'b010; // ADD (to calculate address)
		// RegDst = 0;
		// ALUSrc = 1;
		// RegWrite = 1;
		// MemtoReg = 1;
		// PCSrc = 0;
		// Jump = 0;
		// ReadData = 32'hDEADBEEF; // Example data from memory
		// #10;

		// // Test Case 7: Load instruction, BEQ operation
		// instr = 32'b000100_00001_00010_0000000000000100; // BEQ instruction
		// ALUControl = 3'b110; // SUB (for comparison)
		// RegDst = 0;
		// ALUSrc = 0;
		// RegWrite = 0;
		// MemtoReg = 0;
		// PCSrc = Zero; // If Zero is asserted, branch should occur
		// Jump = 0;
		// ReadData = 32'h00000000;
		// #10;
		
		// // Test Case 1: Load instruction, ADD operation
        // instr = 32'b000000_00001_00010_00011_00000_100000; // R-type ADD
        // ALUControl = 3'b010; // ADD
        // RegDst = 1;
        // ALUSrc = 0;
        // RegWrite = 1;
        // MemtoReg = 0;
        // PCSrc = 0;
        // Jump = 0;
        // ReadData = 32'h00000000;
        // #10;

        // // Test Case 2: Load instruction, SUB operation
        // instr = 32'b000000_00001_00010_00011_00000_100010; // R-type SUB
        // ALUControl = 3'b110; // SUB
        // #10;

        // // Test Case 3: Load instruction, AND operation
        // instr = 32'b000000_00001_00010_00011_00000_100100; // R-type AND
        // ALUControl = 3'b000; // AND
        // #10;
		
		// @(negedge clk);
		// // Test Case 4: Load instruction, OR operation
		// instr = 32'b000000_00001_00010_00011_00000_100101; // R-type OR
		// ALUControl = 3'b001; // OR
		// RegDst = 1;
		// ALUSrc = 0;
		// RegWrite = 1;
		// MemtoReg = 0;
		// PCSrc = 0;
		// Jump = 0;
		// ReadData = 32'h00000000;
		// #10;
		// @(negedge clk);
		// // Test Case 5: Load instruction, SLT operation
		// instr = 32'b000000_00001_00010_00011_00000_101010; // R-type SLT
		// ALUControl = 3'b111; // SLT
		// RegDst = 1;
		// ALUSrc = 0;
		// RegWrite = 1;
		// MemtoReg = 0;
		// PCSrc = 0;
		// Jump = 0;
		// ReadData = 32'h00000000;
		// #10;
		
		// // Test Case 6: Load instruction, LW operation
		// instr = 32'b100011_00001_00010_0000000000000000; // LW instruction // LW instruction
		// ALUControl = 3'b010; // ADD (to calculate address)
		// RegDst = 0;
		// ALUSrc = 1;
		// RegWrite = 1;
		// MemtoReg = 1;
		// PCSrc = 0;
		// Jump = 0;
		// ReadData = 32'hDEADBEEF; // Example data from memory
		// #10;

		// // Test Case 7: Load instruction, BEQ operation
		// instr = 32'b000100_00001_00010_0000000000000100; // BEQ instruction
		// ALUControl = 3'b110; // SUB (for comparison)
		// RegDst = 0;
		// ALUSrc = 0;
		// RegWrite = 0;
		// MemtoReg = 0;
		// PCSrc = Zero; // If Zero is asserted, branch should occur
		// Jump = 0;
		// ReadData = 32'h00000000;
		// #10;
        // $stop;
    // end

// endmodule

`timescale 1ns / 1ps

module DataPath_tb();

    // Testbench signals
    reg clk, reset_n;
    reg MemtoReg, Jump, PCSrc;
    reg ALUSrc, RegDst, RegWrite;
    reg [2:0] ALUControl;
    reg [31:0] ReadData, instr;
    wire [31:0] PC, ALUResult, WriteData;
    wire Zero;

    // Instantiate the DataPath
    DataPath DUT (
        .clk(clk),
        .reset_n(reset_n),
        .MemtoReg(MemtoReg),
        .Jump(Jump),
        .PCSrc(PCSrc),
        .ALUControl(ALUControl),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .ReadData(ReadData),
        .instr(instr),
        .PC(PC),
        .ALUResult(ALUResult),
        .WriteData(WriteData),
        .Zero(Zero)
    );
	
	initial begin
	$readmemh("RegisterFileBios.data",DUT.RegisterFile_U1.Registers);
	end
    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;
        MemtoReg = 0;
        Jump = 0;
        PCSrc = 0;
        ALUSrc = 0;
        RegDst = 0;
        RegWrite = 0;
        ALUControl = 3'b000;
        ReadData = 0;
        instr = 32'b0;
        
        // Apply reset
        #10;
        reset_n = 1;

        // Test Case 1: R-type ADD instruction
        instr = 32'b000000_00001_00010_00011_00000_100000; // R-type ADD (ADD $3, $1, $2)
        ALUControl = 3'b010; // ADD
        RegDst = 1;
        ALUSrc = 0;
        RegWrite = 1;
        MemtoReg = 0;
        PCSrc = 0;
        Jump = 0;
        ReadData = 32'h00000000;
        #20;

        // Test Case 2: R-type SUB instruction
        instr = 32'b000000_00001_00010_00011_00000_100010; // R-type SUB (SUB $3, $1, $2)
        ALUControl = 3'b110; // SUB
        #20;

        // Test Case 3: R-type AND instruction
        instr = 32'b000000_00001_00010_00011_00000_100100; // R-type AND (AND $3, $1, $2)
        ALUControl = 3'b000; // AND
        #20;

        // Test Case 4: R-type OR instruction
        instr = 32'b000000_00001_00010_00011_00000_100101; // R-type OR (OR $3, $1, $2)
        ALUControl = 3'b001; // OR
        #20;

        // Test Case 5: R-type SLT instruction
        instr = 32'b000000_00001_00010_00011_00000_101010; // R-type SLT (SLT $3, $1, $2)
        ALUControl = 3'b111; // SLT
        #20;

        // Test Case 6: LW (Load Word) instruction
        instr = 32'b100011_00001_00010_0000000000000000; // LW instruction (LW $2, 0($1))
        ALUControl = 3'b010; // ADD (for address calculation)
        ALUSrc = 1;
        RegDst = 0;
        RegWrite = 1;
        MemtoReg = 1;
        ReadData = 32'hDEADBEEF; // Data from memory
        #20;

        // Test Case 7: BEQ (Branch on Equal) instruction
        instr = 32'b000100_00001_00010_0000000000000100; // BEQ instruction (BEQ $1, $2, offset)
        ALUControl = 3'b110; // SUB (for comparison)
        RegWrite = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        PCSrc = Zero; // Branch if Zero is asserted
        #20;
		// Test Case 8: BEQ instruction (BEQ $1, $2, offset)
        instr = 32'b000100_00001_00010_0000000000000100; // BEQ $1, $2, offset
        ALUControl = 3'b110; // SUB (for comparison)
        RegWrite = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        PCSrc = Zero; // Branch if Zero is asserted
        #20;

        // Test Case 9: JUMP instruction (J target)
        instr = 32'b000010_00000000000000000000000100; // Jump to address
        Jump = 1; // Enable jump
        RegWrite = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        PCSrc = 0;
        #20;
        Jump = 0; // Disable jump after 20 ns

        // Test Case 10: ADDI instruction (ADDI $2, $1, immediate)
        instr = 32'b001000_00001_00010_0000000000001010; // ADDI $2, $1, 10
        ALUControl = 3'b010; // ADD
        ALUSrc = 1; // Immediate
        RegDst = 0; // Write to rt
        RegWrite = 1;
        MemtoReg = 0;
        ReadData = 32'h00000000;
        #20;

        // Test Case 11: LUI instruction (LUI $2, immediate)
        instr = 32'b001111_00000_00010_0000000000001010; // LUI $2, 10
        ALUControl = 3'b010; // LUI sets upper 16 bits
        ALUSrc = 1; // Immediate
        RegDst = 0; // Write to rt
        RegWrite = 1;
        MemtoReg = 0;
        #20;

        // Test Case 12: SLTI instruction (SLTI $2, $1, immediate)
        instr = 32'b001010_00001_00010_0000000000001010; // SLTI $2, $1, 10
        ALUControl = 3'b111; // SLT comparison
        ALUSrc = 1;
        RegDst = 0;
        RegWrite = 1;
        MemtoReg = 0;
        #20;

        $stop; // End simulation
    end

endmodule

