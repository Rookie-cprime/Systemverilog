`timescale 1ns/1ns
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
			};

module top;
bit clk;
always	#10 clk = ~clk;
fetch_ifc fif(clk);
test t1(fif.TEST,fif.MONITOR);
fetch f1(fif.DUT);
endmodule