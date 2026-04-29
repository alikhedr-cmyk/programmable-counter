`timescale 1ns/1ps

module tb_control_unit();
    reg  [1:0] mode;
    wire req_up, req_down, req_load, req_hold;

    // Instantiate the Unit Under Test (UUT)
    control_unit uut (
        .mode(mode),
        .req_up(req_up),
        .req_down(req_down),
        .req_load(req_load),
        .req_hold(req_hold)
    );

    initial begin
        $display("Starting Control Unit Unit Test...");
        
        // Test Case 00: Hold
        mode = 2'b00; #10;
        if (req_hold === 1) $display("[PASS] Mode 00: Hold Active");
        
        // Test Case 01: Up
        mode = 2'b01; #10;
        if (req_up === 1)   $display("[PASS] Mode 01: Up Active");

        // Test Case 10: Down
        mode = 2'b10; #10;
        if (req_down === 1) $display("[PASS] Mode 10: Down Active");

        // Test Case 11: Load
        mode = 2'b11; #10;
        if (req_load === 1) $display("[PASS] Mode 11: Load Active");

        $display("Control Unit Testing Complete.");
        $finish;
    end
endmodule
