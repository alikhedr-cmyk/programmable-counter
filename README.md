# Programmable Counter in Verilog

## Project Overview
This project implements a programmable digital counter in Verilog. The design is divided into separate modules so that control, synchronization, arithmetic, features, verification, and integration can be developed in parallel by an 8-person team.

## Selected Topic
Programmable Counter

## Repository Structure
```text
programmable-counter/
|-- src/
|   |-- top_module.v
|   |-- control_unit.v
|   |-- sync_logic.v
|   |-- counter_core.v
|   |-- features.v
|   |-- params.vh
|-- tb/
|   |-- testbench.v
|   |-- control_unit_tb.v
|   |-- counter_core_tb.v
|-- docs/
|   |-- report_notes.md
|   |-- team_task_breakdown.md
|-- .gitignore
|-- README.md
```

## Module Summary
- `top_module.v`: connects all modules together
- `control_unit.v`: decodes the `mode` only
- `sync_logic.v`: handles `reset`, `enable`, and execution gating
- `counter_core.v`: performs basic increment, decrement, and load operations
- `features.v`: holds wrap-around, flags, and terminal-count behavior
- `params.vh`: shared configuration header for parameter-related work
- `control_unit_tb.v`: unit testbench for the control logic
- `counter_core_tb.v`: unit testbench for the arithmetic core
- `testbench.v`: full-system simulation after integration

## Basic Design Assumptions
- Default counter width is `4-bit`
- `parameter WIDTH = 4` makes the design configurable
- Counting happens on `posedge clk`
- `reset` has the highest priority
- `enable = 0` means hold the current value
- `mode` encoding:
  - `2'b00` = Hold
  - `2'b01` = Up
  - `2'b10` = Down
  - `2'b11` = Load

## Team Task Distribution
- Trneem : `control_unit.v`
- Person 2: `sync_logic.v`
- Esma : `counter_core.v`
- Muqaddas : `features.v`
- Person 5: `params.vh`
- Orpy: `control_unit_tb.v` and `counter_core_tb.v`
- Nikita: `testbench.v` and GTKWave screenshots
- Gehad : `top_module.v`, integration, GitHub organization, and final report assembly

## How To Run The Project
You can simulate the design using Icarus Verilog and view the waveform using GTKWave.

### Required Tools
- Icarus Verilog
- GTKWave

### Compile The Full System
Run the following command from the project root:

```powershell
iverilog -o sim.out .\src\top_module.v .\src\control_unit.v .\src\sync_logic.v .\src\counter_core.v .\src\features.v .\tb\testbench.v
```

### Run The Full-System Testbench
```powershell
vvp .\sim.out
```

### Open The Waveform
```powershell
gtkwave .\counter_wave.vcd
```

### Unit Test For `control_unit`
```powershell
iverilog -o control_unit_tb.out .\src\control_unit.v .\tb\control_unit_tb.v
vvp .\control_unit_tb.out
```

### Unit Test For `counter_core`
```powershell
iverilog -o counter_core_tb.out .\src\counter_core.v .\tb\counter_core_tb.v
vvp .\counter_core_tb.out
```

## Notes For The Final Submission
- Upload the full source code and report to GitHub
- Put the GitHub repository link at the beginning of the report
- Compress the source code folder and report into one ZIP file for ALMS
- Add waveform screenshots and testbench results to the report
- Include all required names, student IDs, and signatures in the printed report
