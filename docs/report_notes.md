# Programmable Counter Working Notes

## Selected Topic
- Programmable Counter

## GitHub Repository Link
- https://github.com/alikhedr-cmyk/programmable-counter

## Team Members
- Person 1: Trneem Abdelmaksud
- Person 2:
- Person 3: Esma Selim
- Person 4: Muqaddas samadova
- Person 5:
- Person 6: Shahajina Akter Orpy
- Person 7: Nikita Afanasev
- Person 8:Gehad Ali Khedr

## Student IDs
- Person 1: 22040102136
- Person 2:
- Person 3: 22040102159
- Person 4: 23040102094
- Person 5:
- Person 6: 24040102038
- Person 7: 23040102128
- Person 8: 23040102086

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
- `sync_logic.v`: Person 2
- `counter_core.v`: Person 3
- `features.v`: Person 4
- `params.vh`: Person 5
- `control_unit_tb.v` and `counter_core_tb.v`: Person 6
- `testbench.v` and GTKWave output: Person 7
- `top_module.v`, GitHub integration, and final report assembly: Person 8

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
- Each person writes the report section for their own module/task.
- All report sections will be combined into one final report that must fit within 3 double-sided sheets.
