/********************************
类是一组数据和一组操作该数据的子程序。
类中的数据称为类属性，其子例程称为方法。
类属性和方法一起定义类实例或对象的内容和功能。
类与C++中的类相同。

动态地创建和销毁面向对象的扩展。类实例或对象可以通过对象句柄传递，对象句柄为语言添加了安全指针功能。
可以用方向input、output、inout或ref声明一个对象。在每种情况下，复制的参数都是对象句柄，而不是对象的内容



类类型将在后面的章节中详细讨论。
***************************************/

module class_data();

//Class with local fields
class Packet;
	int address	;
	bit [63:0] data;
	shortint crc;
endclass:Packet

//Class with task
class print;
	task print_io (input string msg);
		$display("%s",msg);
	endtask:print_io
endclass:print

//Create instance
Packet p;
print prn;

initial begin
		//Allocate memory
		p = new();
		prn = new();
		//Assign values
		p.address = 32'hDEAD_BEAF;
		p.data	=	{4{16'h5555}}
		p.crc = 0;
		//Print all the assigned values
		$display("p.address = %d,p.data=%h,p.crc = %d",p.address,p.data,p.crc);
		prn.print_io("Test calling task inside class");
		$finish;
end

endmodule
		
end