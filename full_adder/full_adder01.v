module full_adder(x,y,cin,sum,carry);
	input   x,y,cin;
	output  sum,cin;
	
	assign sum   = x^y^cin;
	assign carry = x&y+(x^y)&cin;
endmodule