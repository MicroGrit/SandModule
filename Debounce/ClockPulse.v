//单脉冲产生电路

module ButtonPulse(
pulse_out,
button_in,
clk,
rst_n
);

input button_in,
input clk,rst_n;
output reg pulse_out;
reg delay0,delay1,delay2;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		{delay2,delay1,delay0}<=3'b000;
	else 
		// delay0<=button_in;
		// delay1<=delay0;
		// delay2<=delay1;
		{delay2,delay1,delay0}<={delay1,delay0,button_in};
end

assign pulse_out = delay0 & delay1 & ~delay2;

endmodule
