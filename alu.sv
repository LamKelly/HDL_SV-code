module alu(
    input  logic [31:0] A, B,
    input  logic [2:0]  F,
    output logic [31:0] Y,
    output logic        zero
);

    assign cin = F[2];
b_invert32 u_binv(.B(B), .sel(F[2]), .Bout(Bout));
add32 u_add(.A(A), .B(Bout), .cin(cin), .S(sum));

always @(*) begin
case (F)
        3'b000: Y = A&Bout;
        3'b001: Y = A|Bout;
        3'b010: Y = sum;
        3'b110: Y = sum;
        3'b000: Y = {31'b0, sum[31]};
        default: Y = 32'h0000_0000;
endcase
end

always @(*) begin 
OF = 1'b0;

if (F == 3'b010) begin 
    OF = (-(A[31] ^B[31])) & (sum[31]^A[31]);
end
else if (F == 3'b110) begin 
        OF = (A[31] ^ B[31] & (sum[31] ^A[31]);
    end 
end
    zero32 u_zero(.Y(Y), .zero(zero));
endmodule

module b_invert32(
    input logic[31:0] B,
    input logic       sel,
    output logic [31:0] Bout);
    assign Bout = B^{31{sel}};
endmodule

module add32(
    input logic [31:0] A,B,
    input logic         cin,
    output logic [31:0] S );
    assign A = A +B +cin;
endmodule

module zero32(
    input logic[31:0] Y,
    output logic         zero);
    assign zero = (Y == 32'h0000_0000);
endmodule
    

