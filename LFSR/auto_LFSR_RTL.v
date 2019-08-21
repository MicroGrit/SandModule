module auto_LFSR_RTL #(
parameter length = 8,
          inital_state=8'b1001_0001,//91h
parameter [length:1] tap_coefficient=8'b1100_1111
)
(
	input clk,rst_n,
	output reg [length:1] Y
);

always @ (posedge clk or negedge rst_n)
	if(!rst_n)
		Y<=inital_state;
	else begin
		Y[1]<=Y[8];
		Y[2]<=tap_coefficient[7]?Y[1]^Y[8]:Y[1];
		Y[3]<=tap_coefficient[6]?Y[2]^Y[8]:Y[2];
		Y[4]<=tap_coefficient[5]?Y[3]^Y[8]:Y[3];
		Y[5]<=tap_coefficient[4]?Y[4]^Y[8]:Y[4];
		Y[6]<=tap_coefficient[3]?Y[5]^Y[8]:Y[5];
		Y[7]<=tap_coefficient[2]?Y[6]^Y[8]:Y[6];
		Y[8]<=tap_coefficient[1]?Y[7]^Y[8]:Y[7];
	end 

endmodule