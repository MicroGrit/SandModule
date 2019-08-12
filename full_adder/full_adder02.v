module add_N(x,y,Cin,Cout,Sum);
	input  x,y,Cin;
	output  Sum,Cout;
	
	assign  {Cout,Sum}=x+y+Cin;
endmodule