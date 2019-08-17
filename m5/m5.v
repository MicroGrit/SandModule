module m5(clk,clrn,out);
input clk,clrn;
output out;

reg [4:0]Q;
wire C0;
assign C0=~(Q[4]^Q[1]};
assign out=Q[4];

always@(posedge clk or negedge clrn)
begin
	if(!clrn)
		Q[4:0]<=5’b0000;
	else
		Q[4:0]<={Q[3:0],C0};
end
endmodule