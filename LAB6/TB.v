`timescale 1ns/1ns

module TB;

reg [3:0] a, b, c;
reg [2:0] sel;
reg clk;
wire [4:0] ret;

ALU U_ALU(a, b, c, sel, clk, ret);

always #5 clk = ~clk;

initial begin

    clk = 0;
    a = 4'b0101;
    b = 4'b0111;
    c = 4'b0001;

    #5 sel = 3'b000;
    #10 sel = 3'b111;
    #10 sel = 3'b100;
    #10 sel = 3'b101;
    #10 sel = 3'b011;
    #10 sel = 3'b010;
    #10 sel = 3'b001;
    #10 sel = 3'b110;
    #10
    $stop;


end


endmodule