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



program automatic test(fetch_ifc.TEST if_t,
						fetch_ifc.MONITOR if_m);
	initial begin
			cntrl_e cntrl;
			$timeformat (-9,0,"ns",5);
			$monitor("%t:pc = %h npc = %h rd = %b state = %s\n",$realtime,if_m.cbm.pc,if_m.cbm.npc,
					if_m.cbm.rd,if_m.cbm.state.name);
			$display("%t:Reset all signals",$realtime);
			it_t.rst <= 1;
			if_t.cb.taddr <= 16'hFFFC;
			it_t.br_taken <= 0	;
			if_t.cb.state <= CNTRL_UPDATE_PC;
			
			repeat(2) @if_t.cb;
			pc_post_reset:assert (if_t.cb.pc == 16'h3000);
			
			@if_t.cb;
			if_t.rst <= 0;//好好观察
			
			@(if_t.cb);
			$display("\n%t: Test loading of target address",$realtime);
			if_t.cb.state <= CNTRL_UPDATE_PC;
			if_t.cb.br_taken <= 1;
			
			repeat(2) @if_t.cb;
			pc_br_taken:assert (if_t.cb.pc == 16'hFFFC)
			
			$display("%t:Did the PC rollover as expected?\n",$realtime);
			
			if_t.cb.br_taken <= 0	;
			if_t.cb.state	 <= CNTRL_UPDATE_PC;
			repeat (5)@(if_t.cb);
			pc_rollover: assert(if_t.cb.pc == 16'h0000);//好好看看
			
			$display("%t: step through all the controller states\n",$realtime);
			for(int i = CNTRL_FETCH;i<=CNTRL_COMPUTE_MEM; i++)begin
				$cast(cntrl,i);
				if(cntrl == CNTRL_UPDATE_PC)
					continue;
				$display("%t: Thy with controller state = %0d %s\n",$realtime,cntrl,cntrl.name);
				if_t.cb.br_taken <= 0;
				if_t.cb.state   <= cntrl;
				repeat (2)@(if_t.cb);
				pc_no_load: assert(if_t.cb.pc == 16'h0001);//好好看看
			end
			
			$display("%t : Tristate on PC output",$realtime);
			if_t.cb.state <= CNTRL_IND_ADDR_RD;
			@(if_t.cb);
			pc_z_read_mem: assert (if_t.cb.pc === 16'hzzzz);	//三个等号，讲究
			
			
	end
endprogram