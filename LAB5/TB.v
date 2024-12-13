`timescale 1ns/1ns

module TB;

reg clk, reset, control;
wire [7:0] count;

UpDownCounter UDC(clk, reset, control, count);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    control = 1;
    #5 reset = 0;
    #20 reset = 1;
    #5 reset = 0;
    #100 control = 0;
    #100 $finish;

end


endmodule