module fetch(clk,rst,state,pc,npc,rd,taddr,br_taker);
input clk,rst,br_taken;
input [15:0] taddr;
input [3:0] state;
output [15:0] pc,npc;
output rd;

wire [15:0] n_addr,updata_addr,up_pc;
reg	 [15:0]	pc_reg;
wire		output_en	;

assign	npc = pc_reg + 1;
assign  n_addr = (br_taken)?taddr:npc;
assign	updata_addr = (state == 0)?n_addr:pc_reg;
assign	up_pc		=	(rst)?'h3000:updata_addr;
assign	output_en	=	(state != 7 && state != 8 && state != 9)?1'b1:1'b0;
assign	pc = (output_en)?pc_reg:'dz;
assign	rd = (output_en)?1'b1:1'bz	;

always	@(posedge clk)begin
		pc_reg	<=	up_pc	;
end

endmodule