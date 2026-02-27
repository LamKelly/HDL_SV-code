//==============================================================
// 32-bit ALU (MIPS-like control)
// F[2:0]:
//   3'b000 : AND
//   3'b001 : OR
//   3'b010 : ADD
//   3'b110 : SUB
//   3'b111 : SLT (signed)
// Outputs:
//   Y      : result
//   Zero   : 1 when Y == 0
//   OF     : signed overflow flag (valid for ADD/SUB, else 0)
//==============================================================
module alu32 (
    input  logic [31:0] A,
    input  logic [31:0] B,
    input  logic [2:0]  F,
    output logic [31:0] Y,
    output logic        Zero,
    output logic        OF
);

    // Use signed views for overflow + SLT
    logic signed [31:0] As, Bs;
    logic signed [31:0] add_s, sub_s;

    always_comb begin
        As    = $signed(A);
        Bs    = $signed(B);
        add_s = As + Bs;
        sub_s = As - Bs;

        // Defaults
        Y  = 32'h0000_0000;
        OF = 1'b0;

        unique case (F)
            3'b000: begin // AND
                Y  = A & B;
                OF = 1'b0;
            end

            3'b001: begin // OR
                Y  = A | B;
                OF = 1'b0;
            end

            3'b010: begin // ADD (signed overflow)
                Y  = logic'(add_s);
                // overflow when A and B have same sign, but sum differs
                OF = (As[31] == Bs[31]) && (add_s[31] != As[31]);
            end

            3'b110: begin // SUB (signed overflow)
                Y  = logic'(sub_s);
                // overflow when A and B have different sign, and result differs from A
                OF = (As[31] != Bs[31]) && (sub_s[31] != As[31]);
            end

            3'b111: begin // SLT (signed)
                Y  = (As < Bs) ? 32'h0000_0001 : 32'h0000_0000;
                OF = 1'b0;
            end

            default: begin
                Y  = 32'h0000_0000;
                OF = 1'b0;
            end
        endcase
    end

    // Zero flag
    assign Zero = (Y == 32'h0000_0000);

endmodule
