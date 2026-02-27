// alu.sv
// 32-bit ALU matching the required interface.
// F encoding (from your picture):
// 000: A AND B
// 001: A OR  B
// 010: A +  B
// 011: not used (outputs 0 here)
// 100: A AND ~B
// 101: A OR  ~B
// 110: A -  B
// 111: SLT (set-on-less-than, signed): Y = 1 if A < B else 0

module alu(
    input  logic [31:0] A, B,
    input  logic [2:0]  F,
    output logic [31:0] Y,
    output logic        zero
);

    // Internal results for each operation
    logic [31:0] and_ab, or_ab, and_anb, or_anb;
    logic [31:0] add_y, sub_y, slt_y;

    // Add/Sub using built-in operators (synthesizes fine in Quartus)
    assign add_y = A + B;
    assign sub_y = A - B;

    // Logic ops (include ~B versions per truth table)
    assign and_ab  = A & B;
    assign or_ab   = A | B;
    assign and_anb = A & ~B;
    assign or_anb  = A | ~B;

    // Signed set-less-than: result is 32'h00000001 if A < B else 0
    assign slt_y = ($signed(A) < $signed(B)) ? 32'h00000001 : 32'h00000000;

    // Select output based on F
    always_comb begin
        unique case (F)
            3'b000: Y = and_ab;
            3'b001: Y = or_ab;
            3'b010: Y = add_y;
            3'b011: Y = 32'h00000000;   // not used
            3'b100: Y = and_anb;
            3'b101: Y = or_anb;
            3'b110: Y = sub_y;
            3'b111: Y = slt_y;
            default: Y = 32'h00000000;
        endcase
    end

    // zero flag: TRUE when Y == 0
    assign zero = (Y == 32'h00000000);

endmodule
