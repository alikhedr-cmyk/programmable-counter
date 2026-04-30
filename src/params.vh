`ifndef PARAMS_VH
`define PARAMS_VH

`define DEFAULT_WIDTH 4

`define MODE_HOLD 2'b00
`define MODE_UP   2'b01
`define MODE_DOWN 2'b10
`define MODE_LOAD 2'b11

`define DEFAULT_MIN {`DEFAULT_WIDTH{1'b0}}
`define DEFAULT_MAX {`DEFAULT_WIDTH{1'b1}}

`endif
