class scoreboard extends uvm_scoreboard;

 `uvm_component_utils(scoreboard)
  uvm_tlm_analysis_fifo#(enco_xtn)wr_tport;
  uvm_tlm_analysis_fifo#(enco_xtn)rd_tport;
  enco_xtn xtn,xtn1;
  real cov;

covergroup encoder_cov;
in1_cp :coverpoint xtn.in{
       bins in1={8'b0000_0001,8'b0000_0010};
       bins in2={8'b0000_0100,8'b0000_1000};
       bins in3={8'b0001_0000,8'b0010_0000};
       bins in4={8'b1000_0000,8'b0100_0000};
       }
endgroup

function new(string name ="scoreboard",uvm_component parent);
 	super.new(name,parent);
        encoder_cov=new();
endfunction

function void build_phase(uvm_phase phase);
  wr_tport=new("wr_tport",this);
  rd_tport=new("rd_tport",this);
endfunction

task run_phase(uvm_phase phase);
forever
begin
 //fork
   begin
     wr_tport.get(xtn);
     encoder_cov.sample();
     xtn.print;
     rf( xtn);
     xtn.print;
   end
   begin
    rd_tport.get(xtn1);
    xtn1.print;

   end 
 //join_any
    cop(xtn,xtn1);
end
endtask

task rf( ref enco_xtn xtn);
  if(xtn.in==8'b000_0001)
     xtn.out=3'd0;
  else if(xtn.in==8'b0000_0010)
     xtn.out=3'd1;
  else if(xtn.in==8'b0000_0100)
     xtn.out=3'd2;
  else if(xtn.in==8'b0000_1000)
     xtn.out=3'd3;
  else if(xtn.in==8'b0001_0000)
     xtn.out=3'd4;
  else if(xtn.in==8'b0010_0000)
     xtn.out=3'd5;
  else if(xtn.in==8'b0100_0000)
     xtn.out=3'd6;
  else if(xtn.in==8'b1000_0000)
     xtn.out=3'd7;
endtask

task cop(enco_xtn xtn ,enco_xtn xtn1);
  if(xtn.out==xtn1.out)
    `uvm_info(get_type_name(),"DATA matched",UVM_MEDIUM)
  else
    `uvm_info(get_type_name(),"data mismatched",UVM_MEDIUM)
endtask

function void extract_phase(uvm_phase phase);
  cov=encoder_cov.get_coverage();
endfunction
   
function void report_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("COVERAGE IS : ---= %f",cov),UVM_MEDIUM)
endfunction

endclass
