//状态机一段式写法
//0101

module Detector01(Sin,CP,nCR,Out);

	input Sin,CP,nCR;
	output Out;
	reg Out;
	reg [1:0] State;
	
	parameter [1:0] S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
	
	always(posedge CP or negedge nCR)
	begin
		if(!nCR)
			State <= S0;
		else
			case(State)
				S0:begin Out=1'b0;State=(Sin==1)?S0:S1;end
				S1:begin Out=1'b0;State=(Sin==1)?S2:S1;end
				S2:begin Out=1'b0;State=(Sin==1)?S0:S3;end
				S3:if(Sin==1)
					begin Out=1'b1;State=S2;end
					else
					begin Out=1'b0;State=S1;end
			endcase
	end
	
endmodule