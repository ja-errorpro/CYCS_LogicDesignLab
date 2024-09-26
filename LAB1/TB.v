`timescale 1ns/1ns

module TB;

reg clk, reset;
wire [7:0] q;

parameter t = 10;
parameter th = 5;

always #th clk = ~clk;

ripple_carry_counter U_RCC(q, clk, reset);

initial begin
    clk = 0;
    reset = 1;
    #th reset = 0;
    #(2*t) reset = 1;
    #th reset = 0;
    #(255*t) 
    
    $finish;
end

endmodule