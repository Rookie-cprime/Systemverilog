/******************************************
时间以整数或定点格式写入，后面不带空格，后接时间单位。
时间文本被解释为按当前时间单位缩放并四舍五入到当前时间精度的实时值。
以下是时间文字示例。
********************************************/

`timescale 100ps/10ps
module time_literals();

time a;
initial begin
	$monitor("@ %g*10ps a = %t",$time,a);
	#1 a = 1ns;
	#1 a = 0.2ns;
	#1 a = 300ps;
	#1 $finish	;
end
endmodule

		
 @ 0 a =                    0
 @ 1 a =                  100
 @ 2 a =                   20
 @ 3 a =                   30
 	 	
