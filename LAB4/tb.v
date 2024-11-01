`timescale 1ns/1ns

module TestBench;

reg [3:0] x, y, z;
wire [3:0] D, B;

FullSubstractor RS(x, y, z, D, B);

parameter t = 10;

initial begin
    x = 0;
    y = 0;
    z = 0;
    #t
    x = 4'b0111;
    y = 4'b0110;
    #t
    x = 4'b0100;
    y = 4'b0011;
    #t
    x = 4'b0011;
    y = 4'b0110;
    #t
    x = 4'b1101;
    y = 4'b0101;
    #t
    x = 4'b1100;
    y = 4'b1011;
    #t
    $stop;

end


endmodule