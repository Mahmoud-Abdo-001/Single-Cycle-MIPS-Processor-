module TOP_tb;

reg clk, reset_n;
wire [31:0] test_value_out;

TOP top (.*);

initial begin
	$readmemh("RegisterFileBios.data",top.DataPath_U1.RegisterFile_U1.Registers);
	$readmemh("InstructionmemoryBios.data",top.InstructionMemory_U1.ROM);
	$readmemh("DataMemory.data",top.DataMemory_U1.RAM);	
end

initial begin 
clk =0 ;
forever #5 clk = ~clk;
end 

initial begin
    reset_n = 0;
    #10; 
    reset_n = 1;
    #170 ;
    $stop;
end

initial begin
    $monitor("At time %t, test_value_out = %h", $time, test_value_out);
end

endmodule


