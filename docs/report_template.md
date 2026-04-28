# Report Template

Use this file as a guide when preparing the final report in Word or PDF. The course requirement says the report must be at most 6 pages and should include the Verilog code.

## First Page

### GitHub Link
Put the GitHub repository link at the beginning of the report.

### Project Title
Configurable Digital Counter in Verilog

### Group Members Table
| Student Name and Surname | Student ID | Signature |
|---|---|---|
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |

## 1. Project Description
Briefly describe what the project does and why it is useful.

Suggested points:
- The project implements a digital counter in Verilog.
- It supports hold, up, down, and load operations.
- It can be extended with extra features such as limits and wrap-around.

## 2. Digital Design
Insert a schematic or block diagram showing:
- `control_unit`
- `sync_logic`
- `counter_core`
- `features`
- `top_module`
- Inputs and outputs

Then explain the design in simple words.

## 3. Important Features
Mention the project features that make it different, for example:
- configurable bit-width
- wrap-around behavior
- overflow and underflow flags
- modular design

## 4. Verilog Implementation
Include the Verilog code for:
- `top_module.v`
- `control_unit.v`
- `sync_logic.v`
- `counter_core.v`
- `features.v`
- `testbench.v`

Use small text size if needed.

## 5. Testbench And Simulation Results
Explain how the design was tested.

Include:
- test cases used
- successful testbench output
- GTKWave screenshots
- short explanation of each result

Suggested test cases:
- reset
- hold
- up count
- down count
- load
- enable and disable behavior
- max/min limits
- wrap-around

## 6. Conclusion
Summarize the final design and mention whether the project worked as expected.
