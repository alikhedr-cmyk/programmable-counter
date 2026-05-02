# Programmable Counter in Verilog

## Project Overview
This project implements a Programmable Counter using Verilog HDL.
The system supports multiple operations including:
Up Counting
Down Counting
Load a specific value
The design follows a Control + Datapath architecture, similar to basic computer architecture systems

## System Architecture
<img width="794" height="319" alt="image" src="https://github.com/user-attachments/assets/30c4001c-8b2d-430a-a919-715b4a32cd5f" />

## Features
Supports Up, Down, and Load operations
Configurable bit-width using parameters
Wrap-around logic
Overflow and underflow detection
Asynchronous reset path with synchronous counting

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
- Mukhammad : `sync_logic.v`
- Esma : `counter_core.v`
- Muqaddas : `features.v`
- Islam : `params.vh`
- Orpy : `control_unit_tb.v` and `counter_core_tb.v`
- Nikita : `testbench.v` and GTKWave screenshots
- Gehad : `top_module.v`, integration, GitHub organization, and final report assembly

## Verification
- Unit testing is available for:
  - `control_unit_tb.v`
  - `counter_core_tb.v`
- Full-system testing is prepared in `testbench.v` and is completed during final integration
- Waveforms are analyzed using GTKWave

# GTKWave screenshots
gtkwave_full_system.png :
<img width="800" height="297" alt="image" src="https://github.com/user-attachments/assets/88963a7e-6f6d-4b2c-b565-a1a821e7df5c" />
gtkwave_overflow.png :
<img width="765" height="77" alt="image" src="https://github.com/user-attachments/assets/3fb0a351-7662-4dc1-9226-1732544dfc4b" />
<img width="767" height="70" alt="image" src="https://github.com/user-attachments/assets/f5228e0e-7f54-4015-87e4-01e15a031c6f" />


## How To Run The Project
You can simulate the design using Icarus Verilog and view the waveform using GTKWave.

### Required Tools
- Icarus Verilog
- GTKWave

### Compile The Full System
Run the following command from the project root:

```powershell
iverilog -I .\src -o sim.out .\src\top_module.v .\src\control_unit.v .\src\sync_logic.v .\src\counter_core.v .\src\features.v .\tb\testbench.v
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
iverilog -I .\src -o control_unit_tb.out .\src\control_unit.v .\tb\control_unit_tb.v
vvp .\control_unit_tb.out
```

### Unit Test For `counter_core`
```powershell
iverilog -I .\src -o counter_core_tb.out .\src\counter_core.v .\tb\counter_core_tb.v
vvp .\counter_core_tb.out
```

## Notes For The Final Submission
- Upload the full source code and report to GitHub
- Put the GitHub repository link at the beginning of the report
- Compress the source code folder and report into one ZIP file for ALMS
- Add waveform screenshots and testbench results to the report
- Include all required names, student IDs, and signatures in the printed report

## Final Note
This project demonstrates a simplified Control + Datapath system, applying key concepts from Computer Architecture including sequential logic, modular design, and hardware verification.
