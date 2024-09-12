module DataMemory_tb();

    // Parameters
    parameter nbits = 32;

    // Inputs
    reg clk;
    reg we;
    reg [nbits-1:0] A;
    reg [nbits-1:0] WD;

    // Outputs
    wire [nbits-1:0] RD;
    wire [15:0] test_valu;

    // Instantiate the Unit Under Test (UUT)
    DataMemory #(nbits) uut (
        .clk(clk),
        .we(we),
        .A(A),
        .WD(WD),
        .RD(RD),
        .test_valu(test_valu)
    );
	
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Testbench logic
    initial begin
        // Initialize inputs
        we = 0;
        A = 0;
        WD = 0;

        // Monitor the outputs
        $monitor("Time: %0t | Address: %h | Write Data: %h | Read Data: %h | Test Value: %h", 
                  $time, A, WD, RD, test_valu);

        // Apply test cases

        // Test Case 1: Read from memory at address 0
        #10 we = 0; A = 32'h00000001;
        
        // Test Case 2: Write to memory at address 1
        #10 we = 1; A = 32'h00000001; WD = 32'hDEADBEEF;
        
        // Test Case 3: Read from memory at address 1
        #10 we = 0; A = 32'h00000001;

        // Test Case 4: Write to memory at address 2
        #10 we = 1; A = 32'h00000002; WD = 32'hCAFEBABE;

        // Test Case 5: Read from memory at address 2
        #10 we = 0; A = 32'h00000002;

        // Add more test cases if needed
        #10 we = 0; A = 32'h000000FF; // Test the last address

        // End the simulation
        #10 $stop;
    end

endmodule
