module InstructionMemory_tb();
reg [7:0]A_tb;
wire [31:0] RD_tb;

InstructionMemory #(32) DUT(.A(A_tb),.RD(RD_tb));

initial begin
A_tb=0;
#10;
A_tb =8'd5;
#5; 
A_tb =8'd15;
#5; 
A_tb =8'd19;
#5; 
A_tb =8'd6;
#5; 
A_tb =8'd5;
#5; 
A_tb =8'd0;
#5; 
A_tb =8'd2;
#5; 
A_tb =8'd4;
#5; 
A_tb =8'd7;
#5; 
A_tb =8'd11;
#5; 
A_tb =8'd122;
#5; 
A_tb =8'd111;
#5;
A_tb =8'd33;
#5; 
A_tb =8'd34;
#5; 
A_tb =8'd15;
#5; 
A_tb =8'd9;
#5; 
A_tb =8'd1;
#5; 
A_tb =8'd17;
#5; 
A_tb =8'd12;
#5; 
A_tb =8'd20;
#5; 
A_tb =8'd33;
#5; 
A_tb =8'd77;
#5; 
A_tb =8'd40;
#5;
$stop;
end
endmodule 
