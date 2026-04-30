// Control Unit (The Decoder)
// Responsibility: Interprets the 'mode' input and issues a specific operation request.

// Include the global macros file
`include "params.vh"

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
            `MODE_HOLD: req_hold = 1'b1; 
            `MODE_UP:   req_up   = 1'b1; 
            `MODE_DOWN: req_down = 1'b1; 
            `MODE_LOAD: req_load = 1'b1; 
            default:    req_hold = 1'b1; // Safety case
        endcase
    end

endmodule
