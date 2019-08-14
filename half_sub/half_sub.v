module half_sub(
	x,
	y,
	d,
	cin
);
  input x;
  input y;
  output d;
  output cin;

  assign d   = x^y;
  assign cin = (~x)&y;
endmodule