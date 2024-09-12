module ProgrammCounter_tb;
    reg clk;
    reg reset_n;
    reg [31:0] PCin;
    wire [31:0] PCout;

    ProgrammCounter uut (
        .clk(clk),
        .reset_n(reset_n),
        .PCin(PCin),
        .PCout(PCout)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset_n = 0;
        PCin = 32'h00000000;
        #10;
        reset_n = 1;  
        #10;
        
        if (PCout !== 32'h00000000) 
            $display("Test 1 Failed: PCout should be 0 after reset. Got: %h", PCout);
        else 
            $display("Test 1 Passed: PCout is 0 after reset.");
        
        PCin = 32'h00000004;
        #10;
        if (PCout !== 32'h00000004) 
            $display("Test 2 Failed: PCout should be 4 after first load. Got: %h", PCout);
        else 
            $display("Test 2 Passed: PCout is 4 after first load.");
        
        PCin = 32'h00000008;
        #10;
        if (PCout !== 32'h00000008) 
            $display("Test 3 Failed: PCout should be 8 after second load. Got: %h", PCout);
        else 
            $display("Test 3 Passed: PCout is 8 after second load.");
        
        
        reset_n = 0;  
        #10;
        if (PCout !== 32'h00000000) 
            $display("Test 4 Failed: PCout should be 0 after reset. Got: %h", PCout);
        else 
            $display("Test 4 Passed: PCout is 0 after reset.");
        
        #10;
        $stop;
    end
endmodule
