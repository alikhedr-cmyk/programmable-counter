//  Control Unit (The Decoder)
// Responsibility: Interprets the 'mode' input and issues a specific operation request.

module control_unit (
    input  wire [1:0] mode,     // Input from the user/system
    
    // Output requests to the sync_logic module
    output reg req_up,
    output reg req_down,
    output reg req_load,
    output reg req_hold
);

    // This is a Pure Combinational Logic (No Clock, No Reset)
    always @(*) begin
        // Initialize all requests to 0 (Default State)
        req_up   = 1'b0;
        req_down = 1'b0;
        req_load = 1'b0;
        req_hold = 1'b0;

        case (mode)
            2'b00: req_hold = 1'b1; // Mode 0: Hold the current value
            2'b01: req_up   = 1'b1; // Mode 1: Increment request
            2'b10: req_down = 1'b1; // Mode 2: Decrement request
            2'b11: req_load = 1'b1; // Mode 3: Load parallel data request
            default: req_hold = 1'b1; // Safety case
        endcase
    end

endmodule
