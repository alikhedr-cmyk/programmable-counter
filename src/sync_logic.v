module sync_logic(
    input  wire clk,
    input  wire reset,
    input  wire enable,
    input  wire req_up,
    input  wire req_down,
    input  wire req_load,
    input  wire req_hold,
    
    output wire core_reset,
    output reg  do_up,
    output reg  do_down,
    output reg  do_load,
    output reg  do_hold
);

    assign core_reset = reset;

    always @(*) begin
        do_up   = 1'b0;
        do_down = 1'b0;
        do_load = 1'b0;
        do_hold = 1'b1;

        if (reset) begin
            do_hold = 1'b1;
        end else if (!enable) begin
            do_hold = 1'b1;
        end else if (req_load) begin
            do_hold = 1'b0;
            do_load = 1'b1;
        end else if (req_up) begin
            do_hold = 1'b0;
            do_up   = 1'b1;
        end else if (req_down) begin
            do_hold = 1'b0;
            do_down = 1'b1;
        end else if (req_hold) begin
            do_hold = 1'b1;
        end
    end

endmodule
