module auto_LFSR_ALOG #(
parameter length = 8,
          inital_state=8'b1001_0001,//91h
parameter [length:1] tap_coefficient=8'b1100_1111
)
(
	input clk,rst_n,
	output reg [length:1] Y
);

integer Cell_ptr;

always @ (posedge clk or negedge rst_n)
	if(!rst_n)
		Y<=inital_state;
	else begin
		for(Cell_ptr=2;Cell_ptr<=legth;Cell_ptr=Cell_ptr+1)
			if(tap_coefficient[length-Cell_ptr+1]==1)
				Y[Cell_ptr]<=Y[Cell_ptr-1]^Y[legth];
			else
				Y[Cell_ptr]<=Y[Cell_ptr-1];
		
		Y[1]<=Y[length];
	end 

endmodule