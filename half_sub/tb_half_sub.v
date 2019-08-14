`timescale 1ns/1ns
`define clock_period 20

module tb_halfsub;
  reg  x,y;

  wire cin; //carryover
  wire d;
  reg clk;

  half_sub uut_half_sub(
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
     #(`clock_period*20)
	  $stop;
  end


endmodule
