# Team Task Breakdown

## Person 1: `control_unit.v`
- Owns mode decoding only
- Keeps the mode mapping fixed:
  - `00` = Hold
  - `01` = Up
  - `10` = Down
  - `11` = Load
- Delivers the control truth table for the report

## Person 2: `sync_logic.v`
- Owns `reset` and `enable` behavior
- Decides whether the final reset style is synchronous or asynchronous
- Makes sure the counter only moves when `enable = 1`
- Documents signal priority in the report

## Person 3: `counter_core.v`
- Owns the arithmetic core
- Implements increment, decrement, load, and hold behavior
- Documents the clocked logic in the report

## Person 4: `features.v`
- Owns wrap-around and terminal-count behavior
- Adds overflow and underflow flags if used
- Documents the extra design features in the report

## Person 5: `params.vh`
- Owns reusable constants and configuration values
- Helps the team keep widths and mode constants consistent
- Documents parameterization and reusability in the report

## Person 6: `control_unit_tb.v` and `counter_core_tb.v`
- Owns unit testing
- Verifies the control decoder and arithmetic core separately
- Provides unit-test results for the report

## Person 7: `testbench.v`
- Owns full-system testing after integration
- Runs GTKWave and captures waveform screenshots
- Provides final simulation evidence for the report

## Person 8: `top_module.v`
- Owns final integration
- Connects all modules together
- Manages GitHub branches and pull requests
- Collects report sections and assembles the final document
