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
        // set defaults 
        final_count = raw_count;
        overflow_flag = 1'b0;
        underflow_flag = 1'b0;
        // counter_core already did the counting, so after wrap up, raw_count will be 0
        if (do_up && raw_count == MIN_VAL[WIDTH-1:0]) begin
            overflow_flag = 1'b1; // overflow happened
        end
        // after wrap down, raw_count will be 15
        if (do_down && raw_count == MAX_VAL[WIDTH-1:0]) begin
            underflow_flag = 1'b1; // underflow happened
        end
    end

endmodule
