module h_adder (A, B, SO, CO);
    input A, B;
    output SO, CO;
    assign SO = A ^ B;
    assign CO = A & B;
endmodule