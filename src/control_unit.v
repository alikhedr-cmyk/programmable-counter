module control_unit(
    input  wire [1:0] mode,
    output reg        req_up,
    output reg        req_down,
    output reg        req_load,
    output reg        req_hold
);

    always @(*) begin
        req_up   = 1'b0;
        req_down = 1'b0;
        req_load = 1'b0;
        req_hold = 1'b0;

        case (mode)
            2'b00: req_hold = 1'b1;
            2'b01: req_up   = 1'b1;
            2'b10: req_down = 1'b1;
            2'b11: req_load = 1'b1;
            default: req_hold = 1'b1;
        endcase

        // TODO: Person 1 can replace this with the final truth table
        // or FSM version if the team decides an FSM is needed.
    end

endmodule
