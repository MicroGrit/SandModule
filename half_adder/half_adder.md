# 01 Half adder
这是一个半加器

    module h_adder (A, B, SO, CO);
    	input A, B;
    	output SO, CO;
    	assign SO = A ^ B;
    	assign CO = A & B;
	endmodule

![Half_adder](./half_adder.png)
