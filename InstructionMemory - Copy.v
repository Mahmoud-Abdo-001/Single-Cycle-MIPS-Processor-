module InstructionMemory #(parameter nbits = 32)(
    input [7:0] A,
    output [nbits-1:0] RD
);

reg [nbits-1:0] ROM [255:0];

assign RD = ROM[A >> 2]; //byte addresseble memory.

endmodule