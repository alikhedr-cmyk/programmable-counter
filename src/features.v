module features #(
    parameter WIDTH   = 4,
    parameter MAX_VAL = (1 << WIDTH) - 1,
    parameter MIN_VAL = 0
)(
    input  wire [WIDTH-1:0] raw_count,
    output reg  [WIDTH-1:0] final_count
);

    always @(*) begin
        final_count = raw_count;

        // TODO: Person 3 writes feature logic here
        // Examples:
        // - wrap-around
        // - min/max limits
        // - configurable bit-width handling
    end

endmodule
