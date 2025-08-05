module top;


import uvm_pkg::*;
import enco_pkg::*;
enco_if in0();

 encoder_8x3 DUT(.in(in0.in),.out(in0.out));




initial
  begin
  `ifdef VCS
         		$fsdbDumpvars(0, top);
        		`endif

	uvm_config_db#(virtual enco_if)::set(null,"*","enco_if",in0);
	run_test();

end
endmodule
