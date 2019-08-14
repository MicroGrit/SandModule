`timescale 1ns/1ns
`define clock_period 20

module fullsub_tb;
  reg  x,y,cout;

  wire cin; //carryover
  wire d;
  reg clk;

  fullsub fullsub_0(
                  .cout(cout),
						.x(x),
						.y(y),
						.d(d),
						.cin(cin)
                  );

  initial clk = 0;
  always #(`clock_period/2) clk = ~clk;

  initial begin
     x = 0;
     repeat(20)
	    #(`clock_period) x = $random;

  end

  initial begin
     y = 0;
     repeat(20)
	    #(`clock_period) y = $random;

  end

   initial begin
     cout = 0;
     repeat(20)
	    #(`clock_period) cout = $random;

  end

  initial begin
     #(`clock_period*20)
	  $stop;
  end


endmodule