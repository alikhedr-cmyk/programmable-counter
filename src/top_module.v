module top_module #(
    parameter WIDTH = 4,
    parameter MAX_VAL = (1 << WIDTH) - 1,
    parameter MIN_VAL = 0
)(
    input  wire                 clk,
    input  wire                 reset,
    input  wire                 enable,
    input  wire [1:0]           mode,
    input  wire [WIDTH-1:0]     load_data,
    output wire [WIDTH-1:0]     count_out,
    output wire                 overflow_flag,
    output wire                 underflow_flag
);

    wire req_up;
    wire req_down;
    wire req_load;
    wire req_hold;

    wire core_reset;
    wire do_up;
    wire do_down;
    wire do_load;
    wire do_hold;

    wire [WIDTH-1:0] raw_count;
    wire [WIDTH-1:0] final_count;

    control_unit u_control_unit (
        .mode(mode),
        .req_up(req_up),
        .req_down(req_down),
        .req_load(req_load),
        .req_hold(req_hold)
    );

    sync_logic u_sync_logic (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .req_up(req_up),
        .req_down(req_down),
        .req_load(req_load),
        .req_hold(req_hold),
        .core_reset(core_reset),
        .do_up(do_up),
        .do_down(do_down),
        .do_load(do_load),
        .do_hold(do_hold)
    );

    counter_core #(
        .WIDTH(WIDTH)
    ) u_counter_core (
        .clk(clk),
        .core_reset(core_reset),
        .do_up(do_up),
        .do_down(do_down),
        .do_load(do_load),
        .load_data(load_data),
        .count(raw_count)
    );

    features #(
        .WIDTH(WIDTH),
        .MAX_VAL(MAX_VAL),
        .MIN_VAL(MIN_VAL)
    ) u_features (
        .raw_count(raw_count),
        .do_up(do_up),
        .do_down(do_down),
        .final_count(final_count),
        .overflow_flag(overflow_flag),
        .underflow_flag(underflow_flag)
    );

    assign count_out = final_count;

    // TODO: Person 8 checks full integration and final wiring here.

endmodule
