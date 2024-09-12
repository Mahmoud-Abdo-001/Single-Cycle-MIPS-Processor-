`timescale 1ns/1ps
module SignExtend_tb;
bit [15:0] in;
bit [31:0] signlmm;

SignExtend DU(.*);
integer i;
initial begin
for(i=0;i<100;i++)begin
    in=$random;
    #2;
end
$stop;
end
endmodule 