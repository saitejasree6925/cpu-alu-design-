module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,
    output reg [7:0] result,
    output reg       zero
);

always @(*) begin
    case (opcode)
        3'b000: result = A + B;  // ADD
        3'b001: result = A - B;  // SUB
        3'b010: result = A & B;  // AND
        3'b011: result = A | B;  // OR
        3'b100: result = A ^ B;  // XOR
        default: result = 8'b0;
    endcase

    if (result == 8'b0)
        zero = 1'b1;
    else
        zero = 1'b0;
end

endmodule