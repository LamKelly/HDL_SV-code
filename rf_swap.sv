module rf_s_nxt (
    input logic [3:0] c0,c1,c2,c3,c4,c5,c6,c7,
    input logic init, swapnow, [2:0] x, [2:0] y,
    output logic [3:0] nxt0, nxt1, nxt2, nxt3, nxt4, nxt5, nxt6, nxt7);

    always_comb begin
        nxt0 = c0; nxt1 = c1; nxt2 = c2; 
        nxt3 = c3; nxt4 = c4; nxt5 = c5; 
        nxt6 = c6; nxt7 = c7;

        // BEHAVIOR 1
        if (init) begin
            nxt0 = 4'd0;    nxt1 = 4'd1;
            nxt2 = 4'd2;    nxt3 = 4'd3;
            nxt4 = 4'd4;    nxt5 = 4'd5; 
            nxt6 = 4'd6;     nxt7 = 4'd7;
        end

        // BEHAVIOR 2
        else if (swapnow) begin
            case (x)
                3'd0: begin
                    case (y)
                        3'd0: nxt0 =c0;    3'd1: nxt0 =c1;
                        3'd2: nxt0 =c2;    3'd3: nxt0 =c3;
                        3'd4: nxt0 =c4;    3'd5: nxt0 =c5;
                        3'd6: nxt0 =c6;    3'd7: nxt0 =c7;
                    endcase
                end
                3'd1: begin
                    case (y)
                        3'd0: nxt1= c0;    3'd1: nxt1= c1;
                        3'd2: nxt1= c2;    3'd3: nxt1= c3;
                        3'd4: nxt1= c4;    3'd5: nxt1= c5;
                        3'd6: nxt1= c6;    3'd7: nxt1= c7;
                    endcase
                end
                3'd2: begin
                    case (y)
                        3'd0: nxt2 = c0;    3'd1: nxt2 = c1;
                        3'd2: nxt2 = c2;    3'd3: nxt2 = c3;
                        3'd4: nxt2 = c4;    3'd5: nxt2 = c5;
                        3'd6: nxt2 = c6;    3'd7: nxt2 = c7;
                    endcase
                end
                3'd3: begin
                    case (y)
                        3'd0: nxt3 = c0;    3'd1: nxt3 = c1;
                        3'd2: nxt3 = c2;    3'd3: nxt3 = c3;
                        3'd4: nxt3 = c4;    3'd5: nxt3 = c5;
                        3'd6: nxt3 = c6;    3'd7: nxt3 = c7;
                    endcase
                end
                3'd4: begin
                    case (y)
                        3'd0: nxt4 = c0;    3'd1: nxt4 = c1;
                        3'd2: nxt4 = c2;    3'd3: nxt4 = c3;
                        3'd4: nxt4 = c4;    3'd5: nxt4 = c5;
                        3'd6: nxt4 = c6;    3'd7: nxt4 = c7;
                    endcase
                end
                3'd5: begin
                    case (y)
                        3'd0: nxt5 = c0;    3'd1: nxt5 = c1;
                        3'd2: nxt5 = c2;    3'd3: nxt5 = c3;
                        3'd4: nxt5 = c4;    3'd5: nxt5 = c5;
                        3'd6: nxt5 = c6;    3'd7: nxt5 = c7;
                    endcase
                end
                3'd6: begin
                    case (y)
                        3'd0: nxt6 = c0;    3'd1: nxt6 = c1;
                        3'd2: nxt6 = c2;    3'd3: nxt6 = c3;
                        3'd4: nxt6 = c4;    3'd5: nxt6 = c5;
                        3'd6: nxt6 = c6;    3'd7: nxt6 = c7;
                    endcase
                end
                3'd7: begin
                    case (y)
                        3'd0: nxt7 = c0;    3'd1: nxt7 = c1;
                        3'd2: nxt7 = c2;    3'd3: nxt7 = c3;
                        3'd4: nxt7 = c4;    3'd5: nxt7 = c5;
                        3'd6: nxt7 = c6;    3'd7: nxt7 = c7;
                    endcase
                end
            endcase
            case (y)
                3'd0: begin
                    case (x)
                        3'd0: nxt0 = c0;    3'd1: nxt0 = c1;
                        3'd2: nxt0 = c2;    3'd3: nxt0 = c3;
                        3'd4: nxt0 = c4;    3'd5: nxt0 = c5;
                        3'd6: nxt0 = c6;    3'd7: nxt0 = c7;
                    endcase
                end
                3'd1: begin
                    case (x)
                        3'd0: nxt1 = c0;    3'd1: nxt1 = c1;
                        3'd2: nxt1 = c2;    3'd3: nxt1 = c3;
                        3'd4: nxt1 = c4;    3'd5: nxt1 = c5;  
                        3'd6: nxt1 = c6;    3'd7: nxt1 = c7;
                    endcase
                end
                3'd2: begin
                    case (x)
                        3'd0: nxt2 =c0;    3'd1: nxt2 =c1;
                        3'd2: nxt2= c2;    3'd3: nxt2 =c3;
                        3'd4: nxt2 = c4;    3'd5: nxt2=c5;
                        3'd6: nxt2 =c6;    3'd7: nxt2 = c7;
                    endcase
                end
                3'd3: begin
                    case (x)
                        3'd0: nxt3 = c0;    3'd1: nxt3 = c1;
                        3'd2: nxt3 = c2;    3'd3: nxt3 = c3;
                        3'd4: nxt3 = c4;    3'd5: nxt3 = c5;
                        3'd6: nxt3 = c6; 3'd7: nxt3 = c7;
                    endcase
                end
                3'd4: begin
                    case (x)
                        3'd0: nxt4 = c0;    3'd1: nxt4 = c1;
                        3'd2: nxt4 = c2;     3'd3: nxt4 = c3;
                        3'd4: nxt4 = c4;    3'd5: nxt4 = c5;
                        3'd6: nxt4 = c6;     3'd7: nxt4 = c7;
                    endcase
                end
                3'd5: begin
                    case (x)
                        3'd0: nxt5 = c0;     3'd1: nxt5 = c1;
                        3'd2: nxt5 = c2;    3'd3: nxt5 = c3;
                        3'd4: nxt5 = c4;    3'd5: nxt5 = c5;
                        3'd6: nxt5 = c6;    3'd7: nxt5 = c7;
                    endcase
                end
                3'd6: begin
                    case (x)
                        3'd0: nxt6 = c0;    3'd1: nxt6 = c1;
                        3'd2: nxt6 =c2;    3'd3: nxt6 = c3;
                        3'd4: nxt6 =c4;    3'd5: nxt6 = c5;
                        3'd6: nxt6 =c6;    3'd7: nxt6 = c7;
                    endcase
                end
                3'd7: begin
                    case (x)
                        3'd0: nxt7 = c0;    3'd1: nxt7 = c1;
                        3'd2: nxt7 = c2;    3'd3: nxt7 = c3;
                        3'd4: nxt7 = c4;    3'd5: nxt7 = c5;
                        3'd6: nxt7 = c6;    3'd7: nxt7 = c7;
                    endcase
                end
            endcase
        end
    end
endmodule


module rf_swap (
    input  logic clk,
    input  logic init,
    input  logic swapnow,
    input  logic [2:0] x,[2:0] y,
    output logic [3:0] R0, [3:0] R1,[3:0] R2, [3:0] R3,[3:0] R4,[3:0] R5, [3:0] R6, [3:0] R7
);

    logic [3:0] n0, n1, n2, n3, n4, n5, n6, n7;

    rf_s_nxt u_next (
        .init(init),.swapnow(swapnow),
        .x(x),.y(y),
        .c0(R0), .c1(R1), .c2(R2), .c3(R3),.c4(R4), .c5(R5), .c6(R6), .c7(R7),
        .nxt0(n0), .nxt1(n1), .nxt2(n2), .nxt3(n3),.nxt4(n4), .nxt5(n5), .nxt6(n6), .nxt7(n7)
    );

    always_ff @(posedge clk) begin
        R0 <= N0;    R1 <= N1;
        R2 <= N2;    R3 <= N3;
        R4 <= N4;    R5 <= N5;
        R6 <= N6;    R7 <= N7;
    end


endmodule
