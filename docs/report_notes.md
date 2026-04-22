# Counter Project Working Notes

## Selected Topic
- Exact topic from the spreadsheet:
- Date and time proof captured:

## GitHub Repository Link
- Add the repository URL here before final submission

## Team Members
- Person 1:
- Person 2:
- Person 3:
- Person 4:
- Person 5:

## Student IDs
- Person 1:
- Person 2:
- Person 3:
- Person 4:
- Person 5:

## Fixed Design Decisions
- Counter width default: `4-bit`
- Configurable parameter: `WIDTH = 4`
- Clock edge: `posedge clk`
- Highest priority: `reset`
- `enable = 0` means hold
- `mode` coding:
  - `00` = Hold
  - `01` = Up
  - `10` = Down
  - `11` = Load
- Operation priority:
  - `reset`
  - `load`
  - `up/down`
  - `hold`

## Module Ownership
- `control_unit.v`: Person 1
- `counter_core.v`: Person 2
- `features.v`: Person 3
- `testbench.v`: Person 4
- `top_module.v`: Person 5

## Report Assets To Collect
- Project schematic image
- GTKWave screenshots
- Successful simulation output
- Final GitHub link
- Printed signature table

## Notes For Integration
- Do not change port names without team agreement
- Do not change mode meanings without team agreement
- Keep the same signal priority in all modules
