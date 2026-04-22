module control_unit(
    input  wire       reset,
    input  wire       enable,
    input  wire [1:0] mode,
    output reg        do_up,
    output reg        do_down,
    output reg        do_load,
    output reg        do_hold
);

    always @(*) begin
        do_up   = 1'b0;
        do_down = 1'b0;
        do_load = 1'b0;
        do_hold = 1'b1;

        // TODO: Person 1 writes control logic here
        // Priority:
        // 1. reset
        // 2. load
        // 3. up/down
        // 4. hold
    end

endmodule


