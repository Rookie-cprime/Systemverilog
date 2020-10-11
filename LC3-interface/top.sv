`timescale 1ns/1ns


module top;
bit clk;
always	#10 clk = ~clk;
fetch_ifc fif(clk);
test t1(fif.TEST,fif.MONITOR);
fetch f1(fif.DUT);
endmodule