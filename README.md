# Configurable Digital Counter in Verilog

## Project Overview
This project implements a configurable digital counter in Verilog. The design is divided into small modules so that the control logic, counting core, extra features, integration, and testing can be developed and explained separately.

## Selected Topic
Replace this line with the exact project/topic name chosen from the course spreadsheet.

## Repository Structure
```text
counter-project/
|-- src/
|   |-- top_module.v
|   |-- control_unit.v
|   |-- counter_core.v
|   |-- features.v
|-- tb/
|   |-- testbench.v
|-- docs/
|   |-- report_notes.md
|   |-- report_template.md
|   |-- submission_checklist.md
|-- .gitignore
|-- README.md
```

## Module Summary
- `top_module.v`: connects all modules together
- `control_unit.v`: decodes `reset`, `enable`, and `mode`
- `counter_core.v`: performs basic counter operations
- `features.v`: applies extra project features such as limits or wrap-around
- `testbench.v`: verifies the design through simulation

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
- Orpy : `counter_core.v`
- Muqaddas : `features.v`
- Nikita : `testbench.v`
- Gehad: `top_module.v`, integration, GitHub organization, final report collection

## How To Run The Project
You can simulate the design using Icarus Verilog and view the waveform using GTKWave.

### Required Tools
- Icarus Verilog
- GTKWave

### Compile
Run the following command from the project root:

```powershell
iverilog -o sim.out .\src\top_module.v .\src\control_unit.v .\src\counter_core.v .\src\features.v .\tb\testbench.v
```

### Run The Testbench
```powershell
vvp .\sim.out
```

### Open The Waveform
```powershell
gtkwave .\counter_wave.vcd
```

## Notes For The Final Submission
- Upload the full source code and report to GitHub
- Put the GitHub repository link at the beginning of the report
- Compress the source code folder and report into one ZIP file for ALMS
- Add waveform screenshots and testbench results to the report
- Include all required names, student IDs, and signatures in the printed report
