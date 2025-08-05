class enco_xtn extends uvm_sequence_item;
   `uvm_object_utils(enco_xtn)

function new(string name ="enco_xtn");
   super.new(name);
endfunction

rand  bit[7:0]in;

bit [2:0]out;
constraint ka{$countones(in)==1;}

function void do_print(uvm_printer printer);
  printer.print_field("in",this.in,8,UVM_BIN);
  printer.print_field("out",this.out,3,UVM_DEC);

endfunction


endclass
