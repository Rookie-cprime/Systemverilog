/********************************
在C语言中，类型转换用于将一种类型的数据类型转换为另一种类型的数据类型。
可以使用强制转换（'）操作更改数据类型。
要强制转换的表达式必须用括号括起来，或放在连接或复制大括号中，并且是自行确定的。
************************************/

module casting_data();

int a = 0	;
shortint b = 0	;

initial begin
	$monitor("%g a = %d b = %h",$time,a,b);
	#1 a = int'(2.3*3.3);
	#1 b = shortint'{8'hDE,8'hAD,8'hBE,8'hEF};
	#1 $finish;
end

endmodule

	
 0 a =           0 b = 0000
 1 a =           8 b = 0000
 2 a =           8 b = beef
	