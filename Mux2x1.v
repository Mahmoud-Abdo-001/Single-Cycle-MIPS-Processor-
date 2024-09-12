module Mux2x1 #(parameter nbit=32)(
    input sel,
    input [nbit-1:0] a,b,
    output reg [nbit-1:0] c
);

always @(*) begin
    case(sel)
    1'b0:c <= a;   //choose from register file
    1'b1:c <= b;   //choose from sign extend 
    default : c <= 0 ;
    endcase
end
endmodule