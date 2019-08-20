//两段式状态机
//推荐写法
//0101

module Detect02(Sin,CP,nCR,Out);
	input Sin,CP,nCR;
	output reg Out;
	
	reg [1:0] Current_state,Next_state;
	
	parameter [1:0] S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
	
	//时序逻辑：描述状态转换
	always@(posedge CP or negedge nCR)
	begin
		if(!nCR)
			Current_state<=S0;
		else
			Current_state<=Next_state;
	end
	
	//组合逻辑：描述下一个状态和输出
	always@(Current_state or Sin)
	begin
		Next_state=2'bxx;
		Out=1'b0;
		
		case(Current_state)
			S0:begin Out=1'b0;Next_state=(Sin==1)?S0:S1;end
			S1:begin Out=1'b0;Next_state=(Sin==1)?S2:S1;end
			S2:begin Out=1'b0;Next_state=(Sin==1)?S0:S3;end
			S3:if(Sin==1)
				begin Out=1'b1;Next_state=S2;end
				else
				begin Out=1'b0;Next_state=S1;end
		endcase
	end
	
endmodule
