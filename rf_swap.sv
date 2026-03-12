module rf_swap_next (
    input  logic [3:0] cur0, cur1, cur2, cur3, cur4, cur5, cur6, cur7,
    input  logic       init,
    input  logic       swapnow,
    input  logic [2:0] x,
    input  logic [2:0] y,
    output logic [3:0] nxt0, nxt1, nxt2, nxt3, nxt4, nxt5, nxt6, nxt7
);

    always_comb begin
        // default = hold present values
        nxt0 = cur0;
        nxt1 = cur1;
        nxt2 = cur2;
        nxt3 = cur3;
        nxt4 = cur4;
        nxt5 = cur5;
        nxt6 = cur6;
        nxt7 = cur7;

        // Behavior 1: initialization
        if (init) begin
            nxt0 = 4'd0;
            nxt1 = 4'd1;
            nxt2 = 4'd2;
            nxt3 = 4'd3;
            nxt4 = 4'd4;
            nxt5 = 4'd5;
            nxt6 = 4'd6;
            nxt7 = 4'd7;
        end

        // Behavior 2: swapping
        else if (swapnow) begin
            // first: write x position with value from y
            case (x)
                3'd0: begin
                    case (y)
                        3'd0: nxt0 = cur0;
                        3'd1: nxt0 = cur1;
                        3'd2: nxt0 = cur2;
                        3'd3: nxt0 = cur3;
                        3'd4: nxt0 = cur4;
                        3'd5: nxt0 = cur5;
                        3'd6: nxt0 = cur6;
                        3'd7: nxt0 = cur7;
                    endcase
                end
                3'd1: begin
                    case (y)
                        3'd0: nxt1 = cur0;
                        3'd1: nxt1 = cur1;
                        3'd2: nxt1 = cur2;
                        3'd3: nxt1 = cur3;
                        3'd4: nxt1 = cur4;
                        3'd5: nxt1 = cur5;
                        3'd6: nxt1 = cur6;
                        3'd7: nxt1 = cur7;
                    endcase
                end
                3'd2: begin
                    case (y)
                        3'd0: nxt2 = cur0;
                        3'd1: nxt2 = cur1;
                        3'd2: nxt2 = cur2;
                        3'd3: nxt2 = cur3;
                        3'd4: nxt2 = cur4;
                        3'd5: nxt2 = cur5;
                        3'd6: nxt2 = cur6;
                        3'd7: nxt2 = cur7;
                    endcase
                end
                3'd3: begin
                    case (y)
                        3'd0: nxt3 = cur0;
                        3'd1: nxt3 = cur1;
                        3'd2: nxt3 = cur2;
                        3'd3: nxt3 = cur3;
                        3'd4: nxt3 = cur4;
                        3'd5: nxt3 = cur5;
                        3'd6: nxt3 = cur6;
                        3'd7: nxt3 = cur7;
                    endcase
                end
                3'd4: begin
                    case (y)
                        3'd0: nxt4 = cur0;
                        3'd1: nxt4 = cur1;
                        3'd2: nxt4 = cur2;
                        3'd3: nxt4 = cur3;
                        3'd4: nxt4 = cur4;
                        3'd5: nxt4 = cur5;
                        3'd6: nxt4 = cur6;
                        3'd7: nxt4 = cur7;
                    endcase
                end
                3'd5: begin
                    case (y)
                        3'd0: nxt5 = cur0;
                        3'd1: nxt5 = cur1;
                        3'd2: nxt5 = cur2;
                        3'd3: nxt5 = cur3;
                        3'd4: nxt5 = cur4;
                        3'd5: nxt5 = cur5;
                        3'd6: nxt5 = cur6;
                        3'd7: nxt5 = cur7;
                    endcase
                end
                3'd6: begin
                    case (y)
                        3'd0: nxt6 = cur0;
                        3'd1: nxt6 = cur1;
                        3'd2: nxt6 = cur2;
                        3'd3: nxt6 = cur3;
                        3'd4: nxt6 = cur4;
                        3'd5: nxt6 = cur5;
                        3'd6: nxt6 = cur6;
                        3'd7: nxt6 = cur7;
                    endcase
                end
                3'd7: begin
                    case (y)
                        3'd0: nxt7 = cur0;
                        3'd1: nxt7 = cur1;
                        3'd2: nxt7 = cur2;
                        3'd3: nxt7 = cur3;
                        3'd4: nxt7 = cur4;
                        3'd5: nxt7 = cur5;
                        3'd6: nxt7 = cur6;
                        3'd7: nxt7 = cur7;
                    endcase
                end
            endcase

            // second: write y position with value from x
            case (y)
                3'd0: begin
                    case (x)
                        3'd0: nxt0 = cur0;
                        3'd1: nxt0 = cur1;
                        3'd2: nxt0 = cur2;
                        3'd3: nxt0 = cur3;
                        3'd4: nxt0 = cur4;
                        3'd5: nxt0 = cur5;
                        3'd6: nxt0 = cur6;
                        3'd7: nxt0 = cur7;
                    endcase
                end
                3'd1: begin
                    case (x)
                        3'd0: nxt1 = cur0;
                        3'd1: nxt1 = cur1;
                        3'd2: nxt1 = cur2;
                        3'd3: nxt1 = cur3;
                        3'd4: nxt1 = cur4;
                        3'd5: nxt1 = cur5;
                        3'd6: nxt1 = cur6;
                        3'd7: nxt1 = cur7;
                    endcase
                end
                3'd2: begin
                    case (x)
                        3'd0: nxt2 = cur0;
                        3'd1: nxt2 = cur1;
                        3'd2: nxt2 = cur2;
                        3'd3: nxt2 = cur3;
                        3'd4: nxt2 = cur4;
                        3'd5: nxt2 = cur5;
                        3'd6: nxt2 = cur6;
                        3'd7: nxt2 = cur7;
                    endcase
                end
                3'd3: begin
                    case (x)
                        3'd0: nxt3 = cur0;
                        3'd1: nxt3 = cur1;
                        3'd2: nxt3 = cur2;
                        3'd3: nxt3 = cur3;
                        3'd4: nxt3 = cur4;
                        3'd5: nxt3 = cur5;
                        3'd6: nxt3 = cur6;
                        3'd7: nxt3 = cur7;
                    endcase
                end
                3'd4: begin
                    case (x)
                        3'd0: nxt4 = cur0;
                        3'd1: nxt4 = cur1;
                        3'd2: nxt4 = cur2;
                        3'd3: nxt4 = cur3;
                        3'd4: nxt4 = cur4;
                        3'd5: nxt4 = cur5;
                        3'd6: nxt4 = cur6;
                        3'd7: nxt4 = cur7;
                    endcase
                end
                3'd5: begin
                    case (x)
                        3'd0: nxt5 = cur0;
                        3'd1: nxt5 = cur1;
                        3'd2: nxt5 = cur2;
                        3'd3: nxt5 = cur3;
                        3'd4: nxt5 = cur4;
                        3'd5: nxt5 = cur5;
                        3'd6: nxt5 = cur6;
                        3'd7: nxt5 = cur7;
                    endcase
                end
                3'd6: begin
                    case (x)
                        3'd0: nxt6 = cur0;
                        3'd1: nxt6 = cur1;
                        3'd2: nxt6 = cur2;
                        3'd3: nxt6 = cur3;
                        3'd4: nxt6 = cur4;
                        3'd5: nxt6 = cur5;
                        3'd6: nxt6 = cur6;
                        3'd7: nxt6 = cur7;
                    endcase
                end
                3'd7: begin
                    case (x)
                        3'd0: nxt7 = cur0;
                        3'd1: nxt7 = cur1;
                        3'd2: nxt7 = cur2;
                        3'd3: nxt7 = cur3;
                        3'd4: nxt7 = cur4;
                        3'd5: nxt7 = cur5;
                        3'd6: nxt7 = cur6;
                        3'd7: nxt7 = cur7;
                    endcase
                end
            endcase
        end
    end
endmodule


module rf_swap (
    input  logic       clk,
    input  logic       init,
    input  logic       swapnow,
    input  logic [2:0] x,
    input  logic [2:0] y,
    output logic [3:0] R0,
    output logic [3:0] R1,
    output logic [3:0] R2,
    output logic [3:0] R3,
    output logic [3:0] R4,
    output logic [3:0] R5,
    output logic [3:0] R6,
    output logic [3:0] R7
);

    logic [3:0] N0, N1, N2, N3, N4, N5, N6, N7;

    rf_swap_next u_next (
        .cur0(R0), .cur1(R1), .cur2(R2), .cur3(R3),
        .cur4(R4), .cur5(R5), .cur6(R6), .cur7(R7),
        .init(init),
        .swapnow(swapnow),
        .x(x),
        .y(y),
        .nxt0(N0), .nxt1(N1), .nxt2(N2), .nxt3(N3),
        .nxt4(N4), .nxt5(N5), .nxt6(N6), .nxt7(N7)
    );

    always_ff @(posedge clk) begin
        R0 <= N0;
        R1 <= N1;
        R2 <= N2;
        R3 <= N3;
        R4 <= N4;
        R5 <= N5;
        R6 <= N6;
        R7 <= N7;
    end

endmodule