`timescale 1ns / 1ps

module ALU(A, B, Op, ALU_out, overflow);
input logic [3:0] A, B;
input logic [2:0] Op;

output logic [3:0] ALU_out;
output logic overflow;

always_comb begin
    // Default values
    ALU_out = 0;
    overflow = 0;

    case (Op)
        3'b000: ALU_out = 0; // Reset
        3'b001: begin
            ALU_out = A + B;
            // Check for signed overflow
            overflow = (A[3] == B[3]) && (ALU_out[3] != A[3]);
        end
        3'b010: begin
            ALU_out = A - B;
            // Check for signed overflow
            overflow = (A[3] != B[3]) && (ALU_out[3] != A[3]);
        end
        3'b011: ALU_out = A & B; // AND
        3'b100: ALU_out = A | B; // OR
        3'b101: ALU_out = ~A;    // NOT A
        3'b110: ALU_out = ~B;    // NOT B
        3'b111: ALU_out = 0;     // Reset
        default: ALU_out = 0;    // Default case
    endcase
end

endmodule

