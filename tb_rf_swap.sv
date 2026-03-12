
`timescale 1ns/1ps

module tb_rf_swap;
    logic clk;
    logic init;
    logic swapnow;
    logic [2:0] x, y;
    logic [3:0] R0, R1, R2, R3, R4, R5, R6, R7;

    rf_swap dut (
        .clk(clk),.init(init),.swapnow(swapnow),
        .x(x),.y(y),
        .R0(R0), .R1(R1), .R2(R2), .R3(R3),.R4(R4), .R5(R5), .R6(R6), .R7(R7)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    task do_init;
        begin
            init= 1'b1;swapnow = 1'b0;
            x= 3'd0; y= 3'd0;
            
            @(posedge clk);
            #1;
            $display("After init:");
            show_regs();
            init = 1'b0;
        end
    endtask

    task do_swap(input [2:0] a, input [2:0] b);
        begin
            x= a;
            y= b;
            swapnow = 1'b1;
            @(posedge clk);
            #1;
            $display("After swap x=%0d, y=%0d:", a, b);
            show_regs();
            swapnow = 1'b0;
        end
    endtask

    initial begin
        init= 1'b0;
        swapnow = 1'b0;
        x = 3'd0;
        y= 3'd0;
//Testcase 1//////////////
        $display("========================================");
        $display("CASE I");
        $display("Target: [7 6 5 4 3 2 1 0]");
        $display("========================================");

        do_init();                 
        do_swap(3'd0, 3'd7);    do_swap(3'd1, 3'd6);
        do_swap(3'd2, 3'd5);    do_swap(3'd3, 3'd4);

        $display("Final CASE I:");
        show_regs();

        if (R0==4'd7 && R1==4'd6 && R2==4'd5 && R3==4'd4 && R4==4'd3 && R5==4'd2 && R6==4'd1 && R7==4'd0)
            $display("CASE I PASS\n");
        else
            $display("CASE I FAIL\n");
//Testcase 2
        $display("========================================");
        $display("CASE II");
        $display("Target: [1 2 3 4 5 6 7 0]");
        $display("========================================");

        do_init();               
        do_swap(3'd0, 3'd1); do_swap(3'd1, 3'd2);
        do_swap(3'd2, 3'd3);    do_swap(3'd3, 3'd4);
        do_swap(3'd4, 3'd5);    do_swap(3'd5, 3'd6);
        do_swap(3'd6, 3'd7);

        $display("Case II:");
        show_regs();

        if (R0==4'd1 && R1==4'd2 && R2==4'd3 && R3==4'd4 && R4==4'd5 && R5==4'd6 && R6==4'd7 && R7==4'd0)
            $display("CASE II PASS\n");
        else
            $display("CASE II FAIL\n");

//Testcase 3///////////
        $display("========================================");
        $display("CASE III");
        $display("Target: [3 1 5 6 0 7 4 2]");
        $display("========================================");

        do_init();                  
        do_swap(3'd0, 3'd3);  do_swap(3'd2, 3'd5);      
        do_swap(3'd4, 3'd6);  do_swap(3'd5, 3'd7);        
        do_swap(3'd3, 3'd4);       

        $display("CASE III:");
        show_regs();

        if (R0==4'd3 && R1==4'd1 && R2==4'd5 && R3==4'd6 && R4==4'd0 && R5==4'd7 && R6==4'd4 && R7==4'd2)
            $display("CASE III PASS\n");
        else
            $display("CASE III FAIL\n");
    end

endmodule

