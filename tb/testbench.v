`timescale 1ns/1ps

module testbench;

    parameter WIDTH = 4;

    reg clock;
    reg reset;
    reg enable;
    reg [1:0] mode;
    reg [WIDTH-1:0] load_data;
    wire [WIDTH-1:0] count_out;
    wire overflow_flag;
    wire underflow_flag;

    localparam FALSE = 1'b0;
    localparam TRUE  = 1'b1;

    localparam [1:0]
        HOLD = 2'b00,
        UP   = 2'b01,
        DOWN = 2'b10,
        LOAD = 2'b11;

    localparam [WIDTH-1:0]
        ZERO_VALUE  = {WIDTH{1'b0}},
        MIN_COUNT = {WIDTH{1'b0}},
        MAX_COUNT = (1 << WIDTH) - 1;

    reg [WIDTH-1:0] expected_count;
    reg expected_overflow;
    reg expected_underflow;

    integer errors;

    top_module #(
        .WIDTH(WIDTH),
        .MAX_VAL((1 << WIDTH) - 1),
        .MIN_VAL(0)
    ) unit_under_test (
        .clk(clock),
        .reset(reset),
        .enable(enable),
        .mode(mode),
        .load_data(load_data),
        .count_out(count_out),
        .overflow_flag(overflow_flag),
        .underflow_flag(underflow_flag)
    );

    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    task apply_and_check;
        input reset_local;
        input enable_local;
        input [1:0] mode_local;
        input [WIDTH-1:0] load_data_local;
        reg [WIDTH-1:0] next_count_local;
    begin
        @(negedge clock);
        reset = reset_local;
        enable = enable_local;
        mode = mode_local;
        load_data = load_data_local;

        next_count_local = expected_count;
        expected_overflow = FALSE;
        expected_underflow = FALSE;

        if (reset_local) begin
            next_count_local = MIN_COUNT;
        end
        else if (enable_local) begin
            case (mode_local)
                HOLD: begin
                    next_count_local = expected_count; // Hold.
                end

                UP: begin
                    if (expected_count == MAX_COUNT) begin
                        next_count_local = MIN_COUNT;
                        expected_overflow = TRUE;
                    end
                    else begin
                        next_count_local = expected_count + 1'b1;
                    end
                end

                DOWN: begin
                    if (expected_count == MIN_COUNT) begin
                        next_count_local = MAX_COUNT;
                        expected_underflow = TRUE;
                    end
                    else begin
                        next_count_local = expected_count - 1'b1;
                    end
                end

                LOAD: begin
                    next_count_local = load_data_local;
                end

                default: begin
                    next_count_local = expected_count;
                end
            endcase
        end

        expected_count = next_count_local;

        @(posedge clock);
        #1;

        if ((count_out !== expected_count) || (overflow_flag !== expected_overflow) || (underflow_flag !== expected_underflow)) begin
            errors = errors + 1;
            $display("[%0t] FAIL exp: count=%0d of=%b uf=%b | got: count=%0d of=%b uf=%b", $time, expected_count, expected_overflow, expected_underflow, count_out, overflow_flag, underflow_flag);
        end
        else begin
            $display("[%0t] PASS count=%0d of=%b uf=%b", $time, count_out, overflow_flag, underflow_flag);
        end
    end
    endtask

    initial begin
        $dumpfile("counter_wave.vcd");
        $dumpvars(0, testbench);

        errors = 0;

        reset = TRUE;
        enable = FALSE;
        mode = HOLD;
        load_data = ZERO_VALUE;

        expected_count = MIN_COUNT;
        expected_overflow = FALSE;
        expected_underflow = FALSE;

        /* Reset */
        apply_and_check(TRUE,  FALSE, HOLD, ZERO_VALUE);
        apply_and_check(FALSE, FALSE, HOLD, ZERO_VALUE);

        /* 1. Hold */
        $display("---- Test 1: Hold ----");
        apply_and_check(FALSE, TRUE, HOLD, 4'd9);
        apply_and_check(FALSE, TRUE, HOLD, 4'd5);

        /* 2. Up */
        $display("---- Test 2: Up ----");
        apply_and_check(FALSE, TRUE, UP, ZERO_VALUE);
        apply_and_check(FALSE, TRUE, UP, ZERO_VALUE);
        apply_and_check(FALSE, TRUE, UP, ZERO_VALUE);

        /* 3. Down */
        $display("---- Test 3: Down ----");
        apply_and_check(FALSE, TRUE, DOWN, ZERO_VALUE);
        apply_and_check(FALSE, TRUE, DOWN, ZERO_VALUE);

        /* 4. Load */
        $display("---- Test 4: Load ----");
        apply_and_check(FALSE, TRUE, LOAD, 4'd10);
        apply_and_check(FALSE, TRUE, HOLD, 4'd12);

        /* 5. Reset during load. */
        $display("---- Test 5: Reset during load. ----");
        apply_and_check(FALSE, TRUE, LOAD, 4'd7);
        apply_and_check(TRUE,  TRUE, LOAD, 4'd12);
        apply_and_check(FALSE, FALSE, HOLD, ZERO_VALUE);

        /* 6. Enable toggling during down-count. */
        $display("---- Test 6: Enable toggling during dowm-count. ----");
        apply_and_check(FALSE, TRUE, LOAD, 4'd4);
        apply_and_check(FALSE, TRUE, DOWN, ZERO_VALUE);
        apply_and_check(FALSE, FALSE, DOWN, ZERO_VALUE);
        apply_and_check(FALSE, TRUE, DOWN, ZERO_VALUE);
        apply_and_check(FALSE, FALSE, DOWN, ZERO_VALUE);

        /* 7. Max/min terminal behavior. */
        $display("---- Test 7: MAX/MIN TERMINAL BEHAVIOR. ----");
        apply_and_check(FALSE, TRUE, LOAD, MAX_COUNT);
        apply_and_check(FALSE, TRUE, HOLD, ZERO_VALUE);
        apply_and_check(FALSE, TRUE, LOAD, MIN_COUNT);

        /* 8. Wrap-around and flags. */
        $display("---- Test 8: Wrap-around and flags. ----");
        apply_and_check(FALSE, TRUE, LOAD, MAX_COUNT);
        apply_and_check(FALSE, TRUE, UP, ZERO_VALUE); // Underflow expected.
        apply_and_check(FALSE, TRUE, HOLD, ZERO_VALUE); // Flag must clear on hold.

        apply_and_check(FALSE, TRUE, LOAD, MIN_COUNT);
        apply_and_check(FALSE, TRUE, DOWN, ZERO_VALUE); // Underflow expected.
        apply_and_check(FALSE, TRUE, HOLD, ZERO_VALUE); // Flag must clear on hold.

        $display("====================================");
        if (errors == 0) begin
            $display("Testbench passed.");
        end
        else begin
            $display("Testbench failed: %0d error(s)", errors);
        end
        $display("====================================");

        #20;
        $finish;
    end

endmodule