module ShiftLeftBy2 #(parameter nbit_in =32 , nbit_out = 32)(
    input [nbit_in-1:0] in,
    output [nbit_out-1:0]out
);
     assign out = in << 2; // *2
endmodule