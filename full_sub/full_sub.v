module fullsub(cout,x,y,d,cin);

  input cout; // carry out bit, borrowed by its next low bit
  input x;
  input y;

  output d;
  output cin;

  assign d = x^y^cout;
  assign cin = (~x&(y^cout))|(y&cout);
endmodule