module div_of_odd(
input clk,
output q
);
parameter n = 3;
integer count = 0;

always@(posedge clk)
	if(count == n-1)
		count<=0;
	else
		count<=count+1;
		
reg clk_x=0,clk_y=0;

always@(posedge clk)
	if(count==n-1)
		clk_x<=~clk_x;
always@(negedge clk)
	if(count == (n-1)/2)
		clk_y<=~clk_y;
	
assign q = clk_x ^ clk_y ;


endmodule
