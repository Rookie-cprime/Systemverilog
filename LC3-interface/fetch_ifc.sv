interface fetch_ifc(input bit clk);
logic rst,br_taken,rd;
logic [15:0] taddr;
cntrl_e state;
logic [15:0] pc,npc;

clocking cb@(posedge clk);
	input pc,npc;
	output taddr,state,br_taken,rst;
endclocking

modport DUT(input clk,rst,br_taken,taddr,state,
			output pc,npc,rd);
			
modport TEST (clocking cb,output rst);

clocking cbm @(posedge clk);
	input pc,npc,rd,taddr,state,br_taken;
endclocking

modport MONITOR(clocking cbm);

endinterface