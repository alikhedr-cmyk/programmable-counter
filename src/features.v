module features #(
    parameter WIDTH   = 4,
    parameter MAX_VAL = (1 << WIDTH) - 1,
    parameter MIN_VAL = 0
)(
    input  wire [WIDTH-1:0] raw_count,
    input  wire             do_up,
    input  wire             do_down,
    output reg  [WIDTH-1:0] final_count,
    output reg              overflow_flag,
    output reg              underflow_flag
);

    always @(*) begin
        final_count     = raw_count;
        overflow_flag   = 1'b0;
        underflow_flag  = 1'b0;

        // TODO: Person 4 adds wrap-around, terminal-count behavior,
        // overflow, and underflow handling here.
        // TODO: Person 5 can connect shared parameters or limit registers
        // through this module if the team keeps features separate.
    end

endmodule
