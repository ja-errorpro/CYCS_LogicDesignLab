module FullSubstractor(x, y, z, D, B);

input [3:0]x, y;
input z;
output [3:0]D, B;

assign D[0] = (~x[0] & ~y[0] & z) | (~x[0] & y[0] & ~z) | (x[0] & ~y[0] & ~z) | (x[0] & y[0] & z);
assign B[0] = (~x[0] & y[0]) | (~x[0] & z) | (y[0] & z);
assign D[1] = (~x[1] & ~y[1] & B[0]) | (~x[1] & y[1] & ~B[0]) | (x[1] & ~y[1] & ~B[0]) | (x[1] & y[1] & B[0]);
assign B[1] = (~x[1] & y[1]) | (~x[1] & B[0]) | (y[1] & B[0]);
assign D[2] = (~x[2] & ~y[2] & B[1]) | (~x[2] & y[2] & ~B[1]) | (x[2] & ~y[2] & ~B[1]) | (x[2] & y[2] & B[1]);
assign B[2] = (~x[2] & y[2]) | (~x[2] & B[1]) | (y[2] & B[1]);
assign D[3] = (~x[3] & ~y[3] & B[2]) | (~x[3] & y[3] & ~B[2]) | (x[3] & ~y[3] & ~B[2]) | (x[3] & y[3] & B[2]);
assign B[3] = (~x[3] & y[3]) | (~x[3] & B[2]) | (y[3] & B[2]);


endmodule


