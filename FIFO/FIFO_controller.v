
parameter data_width = 8 ;
parameter addr_depth = 16 ;
parameter ptr_depth = 8 ;

module FIFO_controller(
input rst_n,
input clk,
input [data_width-1:0] data_in,
input we,
input re,

output [data_width-1:0] data_out,
output full,
output empty
);


reg [data_width-1:0] ram [addr_depth-1:0];
reg [ptr_depth-1:0] read_ptr,write_ptr;
reg [ptr_depth:0] ptr_gap;

assign full=(ptr_gap==addr_depth);
assign empty=(ptr_gap==0);

always @ (posedge clk or negedge rst_n)
	if(!rst_n)
	begin
		data_out <=0;
		read_ptr <=0;
		write_ptr<=0;
		ptr_gap <=0;
	end
	else if (we &&(!full)&&(!re))
	begin
		ram[write_ptr]<=data_in;
		write_ptr<=write_ptr+1;
		ptr_gap<=ptr_gap+1;
	end
	else if (we && (!empty) && (!we))
	begin
		data_out<=ram[read_ptr];
		read_ptr<=read_ptr+1;
		ptr_gap<=ptr_gap-1;
	end

endmodule