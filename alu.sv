// =====================
// 1-bit Full Adder
// =====================
module full_adder_1bit (
    input  logic X,
    input  logic Y,
    input  logic Cin,
    output logic S,
    output logic Cout
);
    logic xor_xy, and_xy, and_xor_c;

    assign xor_xy    = X ^ Y;
    assign S         = xor_xy ^ Cin;

    assign and_xy    = X & Y;
    assign and_xor_c = xor_xy & Cin;

    assign Cout      = and_xy | and_xor_c;
endmodule


// =====================
// 32-bit Ripple Adder (ONE subcircuit)
// =====================
module adder_32bit (
    input  logic [31:0] A,
    input  logic [31:0] B,
    input  logic        Cin,
    output logic [31:0] S,
    output logic        Cout
);
    logic [32:0] c;
    assign c[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : GEN_FA
            full_adder_1bit fa (
                .X   (A[i]),
                .Y   (B[i]),
                .Cin (c[i]),
                .S   (S[i]),
                .Cout(c[i+1])
            );
        end
    endgenerate

    assign Cout = c[32];
endmodule


// =====================
// 2:1 MUX (param width)
// =====================
module mux2 #(
    parameter int W = 1
)(
    input  logic [W-1:0] in0,
    input  logic [W-1:0] in1,
    input  logic         sel,
    output logic [W-1:0] out
);
    assign out = (sel) ? in1 : in0;
endmodule


// =====================
// 4:1 MUX (param width)
// sel: 00->in0, 01->in1, 10->in2, 11->in3
// =====================
module mux4 #(
    parameter int W = 1
)(
    input  logic [W-1:0] in0,
    input  logic [W-1:0] in1,
    input  logic [W-1:0] in2,
    input  logic [W-1:0] in3,
    input  logic [1:0]   sel,
    output logic [W-1:0] out
);
    always_comb begin
        unique case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
        endcase
    end
endmodule


// =====================
// 32-bit ALU
// F[2] = 0 add / 1 subtract (B invert + Cin=1)
// F[1:0]:
//   00 AND
//   01 OR
//   10 SUM/DIFF
//   11 SLT (zero-extend sign of SUM into bit0)
// =====================
module alu32 (
    input  logic [31:0] A,
    input  logic [31:0] B,
    input  logic [2:0]  F,
    output logic [31:0] Y,
    output logic        Cout,
    output logic        Overflow
);
    // ---- B invert stage (MUX2) ----
    logic [31:0] B_inv, B_sel;
    assign B_inv = ~B;

    mux2 #(32) mux_b (
        .in0(B),
        .in1(B_inv),
        .sel(F[2]),
        .out(B_sel)
    );

    // ---- AND/OR blocks ----
    logic [31:0] and_out, or_out;
    assign and_out = A & B_sel;
    assign or_out  = A | B_sel;

    // ---- 32-bit adder block (single subcircuit) ----
    logic [31:0] S;
    adder_32bit add32 (
        .A   (A),
        .B   (B_sel),
        .Cin (F[2]),
        .S   (S),
        .Cout(Cout)
    );

    // ---- SLT zero-extend ----
    logic [31:0] slt_out;
    assign slt_out = {31'b0, S[31]};

    // ---- Output select ----
    mux4 #(32) mux_y (
        .in0(and_out),
        .in1(or_out),
        .in2(S),
        .in3(slt_out),
        .sel(F[1:0]),
        .out(Y)
    );

    // ---- Overflow logic (same idea as your 16-bit) ----
    // Use original A[31], B[31] (not inverted) like the sketch logic.
    logic xor0, xor1;
    logic add_over, sub_over;

    assign xor0     = A[31] ^ B[31];
    assign xor1     = A[31] ^ S[31];
    assign add_over = xor1 & ~xor0;
    assign sub_over = xor1 &  xor0;

    mux2 #(1) mux_ov (
        .in0(add_over),
        .in1(sub_over),
        .sel(F[2]),
        .out(Overflow)
    );

endmodule

