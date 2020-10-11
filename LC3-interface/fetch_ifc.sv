typedef enum{CNTRL_UPDATE_PC = 0,
			 CNTRL_FETCH,
			 CNTRL_DECODE,
			 CNTRL_EXECUTE,
			 CNTRL_UPDATE_REGF,
			 CNTRL_COMPUTE_PC,
			 CNTRL_COMPUTE_MEM,
			 CNTRL_READ_MEM,
			 CNTRL_IND_ADDR_RD,
			 CNTRL_WRITE_MEM
			} cntrl_e;


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