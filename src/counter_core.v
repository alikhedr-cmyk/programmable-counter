module counter_core #(
    parameter WIDTH = 4
)(
    input  wire                 clk,
    input  wire                 reset,
    input  wire                 do_up,
    input  wire                 do_down,
    input  wire                 do_load,
    input  wire [WIDTH-1:0]     load_data,
    output reg  [WIDTH-1:0]     count
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= {WIDTH{1'b0}};
        end else begin
            // TODO: Person 2 writes counter logic here
            // if (do_load) ...
            // else if (do_up) ...
            // else if (do_down) ...
            // else hold current value
            count <= count;
        end
    end

endmodule
