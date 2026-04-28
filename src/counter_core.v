module counter_core #(
    parameter WIDTH = 4
)(
    input  wire                 clk,
    input  wire                 core_reset,
    input  wire                 do_up,
    input  wire                 do_down,
    input  wire                 do_load,
    input  wire [WIDTH-1:0]     load_data,
    output reg  [WIDTH-1:0]     count
);

    always @(posedge clk or posedge core_reset) begin
        if (core_reset) begin
            count <= {WIDTH{1'b0}};
        end else if (do_load) begin
            count <= load_data;
        end else if (do_up) begin
            count <= count + 1'b1;
        end else if (do_down) begin
            count <= count - 1'b1;
        end else begin
            count <= count;
        end
    end

endmodule
