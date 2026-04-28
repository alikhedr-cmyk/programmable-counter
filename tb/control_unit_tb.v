`timescale 1ns/1ps

module control_unit_tb;

    reg  [1:0] mode;
    wire       req_up;
    wire       req_down;
    wire       req_load;
    wire       req_hold;

    control_unit uut (
        .mode(mode),
        .req_up(req_up),
        .req_down(req_down),
        .req_load(req_load),
        .req_hold(req_hold)
    );

    initial begin
        mode = 2'b00;

        // TODO: Person 6 adds unit-test checks for all four mode values.
        #10 mode = 2'b01;
        #10 mode = 2'b10;
        #10 mode = 2'b11;
        #10 $finish;
    end

endmodule
