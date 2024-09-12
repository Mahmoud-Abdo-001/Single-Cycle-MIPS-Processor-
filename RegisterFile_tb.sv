
`timescale 1ns/1ps
module RegisterFile_tb ();
	parameter nbits=32;
    bit clk;
    bit we3;
    bit [4:0] A1,A2,A3;//4 state
    bit [nbits-1:0] RD1,RD2;
    bit [nbits-1:0] wd3; // data to be writen in a register

    class rand_io;
        rand bit we3;
        rand bit [4:0] A1,A2,A3;
        rand bit [31:0] wd3;
        constraint dist_we3{we3 dist{0:=80,1:=20};}
    endclass

    rand_io ios=new();//creat new opject 

    RegisterFile DUT(.*);

    initial begin
        clk=0;
        forever begin
          #1  clk=!clk;
        end
    end

    integer i;
    initial begin
    for(i=0;i<1000;i++)begin
        assert(ios.randomize());
        A1=ios.A1;
        A2=ios.A2;
        A3=ios.A3;
        we3=ios.we3;
		// we3=0;
        wd3=ios.wd3;
        @(negedge clk);
    end
    $stop;
    end
	

endmodule