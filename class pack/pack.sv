module test();

class Transaction;
	bit [31:0] 	addr,crc,data[8];//实际数据
	static int count = 0		;
	int id;
	
	function new();
		id = count++;
	endfunction
	
	function void display();
		$write("Tr: id = %0d,addr = %x,crc = %x\n",id,addr,crc)	;
		foreach(data[i]) $write("%x\n",data[i])	;
		$display;
	endfunction
	
	function void pack(ref byte bytes[40]);
		bytes = {>>{addr,crc,data}};
	endfunction
	
	function void unpack(ref byte bytes[40]);
		{>>{addr,crc,data}} = bytes;
	endfunction
endclass:Transaction

Transaction tr,tr2;
byte b[40]	;

initial begin
		tr = new();
		tr.addr = 32'ha0a0a0a0;
		tr.crc = '1;
		foreach(tr.data[i])
			tr.data[i] = i;
		tr.pack(b);
		$write("Pack result:");
		foreach(b[i])
			$write("%h\n",b[i])	;
		$display;
		
		tr2 = new();
		tr2.unpack(b);
		tr2.display();
end

endmodule