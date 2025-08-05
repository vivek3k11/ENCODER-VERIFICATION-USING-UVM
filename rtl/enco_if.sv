interface enco_if;

logic [7:0]in;
logic [2:0]out;

modport MP_WR(output in);
modport MMP_WR(input in);
modport MP_RD(input in,input out);



endinterface
