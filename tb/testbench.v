`timescale 1ns/1ps

module testbench;

    parameter WIDTH = 4;

    reg                  clk;
    reg                  reset;
    reg                  enable;
    reg  [1:0]           mode;
    reg  [WIDTH-1:0]     load_data;
    wire [WIDTH-1:0]     count_out;
    wire                 overflow_flag;
    wire                 underflow_flag;

    top_module #(
        .WIDTH(WIDTH),
        .MAX_VAL((1 << WIDTH) - 1),
        .MIN_VAL(0)
    ) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .mode(mode),
        .load_data(load_data),
        .count_out(count_out),
        .overflow_flag(overflow_flag),
        .underflow_flag(underflow_flag)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("counter_wave.vcd");
        $dumpvars(0, testbench);

        reset     = 1'b1;
        enable    = 1'b0;
        mode      = 2'b00;
        load_data = {WIDTH{1'b0}};

        #10;
        reset = 1'b0;

        // TODO: Person 7 writes the full-system test cases here.
        // Test cases:
        // 1. hold
        // 2. up
        // 3. down
        // 4. load
        // 5. reset during load
        // 6. enable toggling during down-count
        // 7. max/min terminal behavior
        // 8. wrap-around and flags

        #100;
        $finish;
    end

endmodule
