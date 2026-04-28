`timescale 1ns/1ps

module counter_core_tb;

    parameter WIDTH = 4;

    reg                  clk;
    reg                  core_reset;
    reg                  do_up;
    reg                  do_down;
    reg                  do_load;
    reg  [WIDTH-1:0]     load_data;
    wire [WIDTH-1:0]     count;

    counter_core #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .core_reset(core_reset),
        .do_up(do_up),
        .do_down(do_down),
        .do_load(do_load),
        .load_data(load_data),
        .count(count)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        core_reset = 1'b1;
        do_up      = 1'b0;
        do_down    = 1'b0;
        do_load    = 1'b0;
        load_data  = {WIDTH{1'b0}};

        #10 core_reset = 1'b0;

        // TODO: Person 6 adds focused tests for load, up, down, and hold.
        #10 do_load = 1'b1; load_data = 4'd5;
        #10 do_load = 1'b0; do_up = 1'b1;
        #10 do_up = 1'b0; do_down = 1'b1;
        #10 do_down = 1'b0;
        #10 $finish;
    end

endmodule
