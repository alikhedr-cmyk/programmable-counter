`timescale 1ns/1ps

module tb_counter_core();
    parameter WIDTH = 4;
    
    reg clk, core_reset, do_up, do_down, do_load;
    reg [WIDTH-1:0] load_data;
    wire [WIDTH-1:0] count;

    // Instantiate UUT
    counter_core #(.WIDTH(WIDTH)) uut (
        .clk(clk), .core_reset(core_reset),
        .do_up(do_up), .do_down(do_down), .do_load(do_load),
        .load_data(load_data), .count(count)
    );

    // Clock Generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0; core_reset = 0; do_up = 0; do_down = 0; do_load = 0; load_data = 0;

        $display("Starting Counter Core Unit Test...");

        // 1. Reset Test
        core_reset = 1; #15;
        core_reset = 0;
        if (count === 4'b0000) $display("[PASS] Reset Successful");

        // 2. Load Test
        load_data = 4'hA; do_load = 1; @(posedge clk); 
        #1; do_load = 0;
        if (count === 4'hA) $display("[PASS] Parallel Load Successful");

        // 3. Increment Test
        do_up = 1; repeat(2) @(posedge clk);
        #1; do_up = 0;
        if (count === 4'hC) $display("[PASS] Increment (+2) Successful");

        // 4. Boundary Test (Underflow)
        load_data = 4'h0; do_load = 1; @(posedge clk);
        #1; do_load = 0; do_down = 1; @(posedge clk);
        #1; 
        if (count === 4'hF) $display("[PASS] Underflow (0->F) Successful");

        $display("Counter Core Testing Complete.");
        $finish;
    end
endmodule
