
module testbench;

logic clk;
logic [31:0] A,B;
logic [2:0] F;
logic [31:0] Y;
logic         zero;
logic         OF;

//outputs
logic [31:0] Yexp;
logic     zeroexp;
logic     OFexp;
// vec memory
logic [103:0] testvectors [0:1000];
logic [2:0] pad;

integer vectornum;
integer errors;

// inst DUI
alu dut (
.A(A),
.B(B),
.F(F),
.Y(Y),
.zero(zero),
.OF(OF) );

//clk
always begin 
clk = 1; #5;
clk = 0; #5;
end

initial begin
$readmemh("alu.tv", testvectors);
vectornum = 0;
errors = 0;
end

// apply inputs
always @(posedge clk) begin #1;
{pad,F,A,B,Yexp,zeroexp,OFexp} = testvectors[vectornum];
end 

//check outputs
always @(negedge clk) begin 

for (i = 0; i <= 20; i++) begin
    
if (testvectors [vectornum] === {104{1'bx}}) begin
    $display("PASS %0d | F=%0d A=%h B=%h | Y=%h zero=%b",
                 i, F, A, B, Y, zero);
      end else begin
        errors++;
        $display("FAIL %0d", i);
        $display("   GOT: Y=%h zero=%b", Y, zero);
        $display("   EXP: Y=%h zero=%b", vectors[i].Yexp, vectors[i].zeroexp);
      end
    end

    $display("===");
    $display(" 21 tests completed with %0d errors", errors);
    end
    
