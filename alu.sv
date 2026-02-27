module alu(
    input  logic [31:0] A, B,
    input  logic [2:0]  F,
    output logic [31:0] Y,
    output logic        zero
);

    // ----------------------------
    // Control decode (matches schematic)
    // ----------------------------
    logic Binvert;
    logic [1:0] sel;
    assign Binvert = F[2];
    assign sel     = F[1:0];

    // ----------------------------
    // B invert block (XOR per bit) and adder Cin
    // ----------------------------
    logic [31:0] Bx;
    assign Bx = B ^ {32{Binvert}};   // if Binvert=1 => ~B

    // ----------------------------
    // 32-bit ripple adder built structurally from 1-bit full adders
    // ----------------------------
    logic [32:0] c;          // carry chain
    logic [31:0] S;          // sum from adder
    assign c[0] = Binvert;   // Cin = Binvert (ADD:0, SUB/SLT:1)

    genvar i;
    generate
        for (i=0; i<32; i++) begin : ADDER
            full_adder fa(
                .a   (A[i]),
                .b   (Bx[i]),
                .cin (c[i]),
                .sum (S[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

    // Overflow for signed subtract/add: carry into MSB XOR carry out of MSB
    logic overflow;
    assign overflow = c[31] ^ c[32];

    // SLT (signed): less = sign(sum) XOR overflow
    logic less;
    assign less = S[31] ^ overflow;

    logic [31:0] SLT_out;
    assign SLT_out = {31'b0, less};  // zero extend

    // ----------------------------
    // Logic blocks
    // ----------------------------
    logic [31:0] AND_out, OR_out;
    assign AND_out = A & B;
    assign OR_out  = A | B;

    // ----------------------------
    // 4-to-1 MUX per bit (structural style)
    // inputs: 0=AND, 1=OR, 2=S(add/sub), 3=SLT
    // ----------------------------
    generate
        for (i=0; i<32; i++) begin : OUTMUX
            mux4 m(
                .d0 (AND_out[i]),
                .d1 (OR_out[i]),
                .d2 (S[i]),
                .d3 (SLT_out[i]),
                .s  (sel),
                .y  (Y[i])
            );
        end
    endgenerate

    // zero flag
    assign zero = ~|Y;

endmodule


// ----------------------------
// 1-bit Full Adder (gate-level style)
// sum  = a ^ b ^ cin
// cout = (a&b) | (a&cin) | (b&cin)
// ----------------------------
module full_adder(
    input  logic a, b, cin,
    output logic sum, cout
);
    logic axb, ab, ac, bc;

    assign axb = a ^ b;
    assign sum = axb ^ cin;

    assign ab  = a & b;
    assign ac  = a & cin;
    assign bc  = b & cin;
    assign cout = ab | ac | bc;
endmodule


// ----------------------------
// 4:1 MUX (structural)
// s=00->d0, 01->d1, 10->d2, 11->d3
// ----------------------------
module mux4(
    input  logic d0, d1, d2, d3,
    input  logic [1:0] s,
    output logic y
);
    logic m0, m1;
    assign m0 = (s[0]) ? d1 : d0;
    assign m1 = (s[0]) ? d3 : d2;
    assign y  = (s[1]) ? m1 : m0;
endmodule
