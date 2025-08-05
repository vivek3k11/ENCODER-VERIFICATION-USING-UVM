
package enco_pkg;
 import uvm_pkg::*;
 `include "uvm_macros.svh";
 `include "enco_xtn.sv";
 `include "my_config.sv";
 
 
 `include "wr_monitor.sv";
 `include "wr_sequencer.sv";
 `include "wr_driver.sv";
`include "wr_agent.sv";

 //`include "";

 `include "rd_monitor.sv";
  `include "rd_agent.sv";

 `include "scoreboard.sv";
 `include "my_env.sv";
 `include "wr_sequence.sv";
 `include "test.sv";







endpackage
