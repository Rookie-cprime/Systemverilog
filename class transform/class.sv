module test_1();


class Statistics;
	time startT,stopT;
	static int ntrans = 0;
	static time total_elapsed_time = 0;
	
	function time how_long();//the output port is function it self
		how_long = stopT-startT;
		ntrans++;
		total_elapsed_time+=how_long;
	endfunction
	
	function Statistics copy();
		copy = new();
		copy.startT = startT;
		copy.stopT = stopT;
	endfunction
endclass

class Transaction;
	bit [31:0]addr,crc,data[8]	;
	Statistics stats;
	static int count = 0;
	int id;
	
	function new();
		stats = new();
		id = count++	;
	endfunction
	
	function Transaction copy();
		copy = new();
		copy.addr = addr;
		copy.crc = crc;
		copy.data = data;
		copy.stats = stats.copy();
		id = count ++;
	endfunction
	
endclass

Transaction src,dst;
initial begin
		src = new();
		$display(src.id);
		src.stats.startT = 42	;
		dst = src.copy();
		$display(src.id);
		$display(dst.id);
		dst.stats.startT = 96;
		$display(src.stats.startT);
end

endmodule