module Comparator(A, B, EQ, GT, LT);
    
    input [3:0] A, B;
    output EQ, GT, LT;

    wire [3:0] x;
    assign x[3] = (A[3] & B[3]) | (~A[3] & ~B[3]);
    assign x[2] = (A[2] & B[2]) | (~A[2] & ~B[2]);
    assign x[1] = (A[1] & B[1]) | (~A[1] & ~B[1]);
    assign x[0] = (A[0] & B[0]) | (~A[0] & ~B[0]);
    assign EQ = x[3] & x[2] & x[1] & x[0];
    assign GT = (A[3] & ~B[3]) | (x[3] & A[2] & ~B[2]) | (x[3] & x[2] & A[1] & ~B[1]) | (x[3] & x[2] & x[1] & A[0] & ~B[0]);
    assign LT = (~A[3] & B[3]) | (x[3] & ~A[2] & B[2]) | (x[3] & x[2] & ~A[1] & B[1]) | (x[3] & x[2] & x[1] & ~A[0] & B[0]);

endmodule