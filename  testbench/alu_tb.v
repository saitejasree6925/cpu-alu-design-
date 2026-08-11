`timescale 1ns/1ps

module alu_tb;

reg  [7:0] A;
reg  [7:0] B;
reg  [2:0] opcode;
wire [7:0] result;
wire       zero;

alu uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .zero(zero)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    $monitor("Time=%0t A=%d B=%d Opcode=%b Result=%d Zero=%b",
             $time, A, B, opcode, result, zero);

    A = 8'd10; B = 8'd5;

    opcode = 3'b000; #10; // ADD
    opcode = 3'b001; #10; // SUB
    opcode = 3'b010; #10; // AND
    opcode = 3'b011; #10; // OR
    opcode = 3'b100; #10; // XOR

    A = 8'd0; B = 8'd0;
    opcode = 3'b000; #10;

    $finish;
end

endmodule