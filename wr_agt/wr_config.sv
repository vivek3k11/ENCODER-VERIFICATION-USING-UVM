class wr_config extends uvm_object;

  `uvm_object_utils(wr_config)
virtual enco_if in;
uvm_active_passive_enum;

function new(string name ="wr_config");
  super.name(name);
endfunction

endclass
