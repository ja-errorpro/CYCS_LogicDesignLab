`timescale 1ns/1ns

module TB;

reg clk;
reg reset;
wire [7:0] q;

parameter t = 10;
parameter th = 5;

always #th clk = ~clk;

Shift Shift0(q, clk, reset);

initial begin
    
    clk = 1'b0;
    reset = 1'b1;
    #t reset = 1'b0;
    #(9*t) reset = 1'b1;
    #t $finish;


end



endmodule