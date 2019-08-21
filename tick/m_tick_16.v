module m_tick_16(
input clk,
output m_tick
);

reg [3:0] q_reg;
wire [3:0] q_next;

always @ (posedge clk)
	q_reg <= q_next;

assign q_next=q_reg+1;

assign m_tick = ( q_reg ==0 ) ? 1'b1 : 1'b0 ;

endmodule