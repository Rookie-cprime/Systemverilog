/*************************************************
结构和联合声明类型与C语言中的类型相同。可以使用结构数据类型来声明复杂的数据类型，它只是其他数据类型的集合。
例如，以太网数据包可以声明为一个结构，其中每个字段都有变量。结构可以作为一个整体来分配，也可以作为一个整体传递给函数或任务。
typedef可以与C语言中的struct一起使用。结构和联合可以是

压缩：压缩结构由位字段组成，这些字段在内存中不留空隙地压缩在一起。

unpacked：一个解包的结构具有依赖于实现的打包，通常与C编译器匹配。

tagged：标记的联合是一个类型检查的联合。
**********************************************/

`timescale 1ns/100ps

///Type defing a struct,and put it outside module
//So that others modules can also use it
typedef struct {
		byte a		;
		reg	 b		;
		shortint unsigned c		;

} myStruct;

module struct_data();

//define a local struct

struct{
	byte a ;
	reg  b ;
	shortint unsigned c;
} myLocalStruct = '{11,1,101};

//When define typedef, we can use as new data type
myStruct object = '{10,0,100}	;

initial begin
		$display("a = %b b = %b c = %h",object.a,object.b,object.c)	;
		$display("a = %b b = %b c = %h",myLocalStruct.a,myLocalStruct.b,myLocalStruct.c)	;
		$finish	;
end

 a = 00001010 b = 0 c = 0064
 a = 00001011 b = 1 c = 0065

endmodule