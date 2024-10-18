`timescale 1ns / 1ns

module Simulate;

parameter t = 10;

reg [3:0] A, B;
wire EQ, GT, LT;

Comparator cmp(A, B, EQ, GT, LT);

initial begin
    
    A = 0;
    B = 0;
    #t

    A = 1;
    B = 15;
    #t

    A = 2;
    B = 14;
    #t

    A = 3;
    B = 13;
    #t

    A = 4;
    B = 12;
    #t

    A = 5;
    B = 11;
    #t

    A = 6;
    B = 10;
    #t

    A = 7;
    B = 9;
    #t

    A = 8;
    B = 8;
    #t

    A = 9;
    B = 7;
    #t

    A = 10;
    B = 6;
    #t

    A = 11;
    B = 5;
    #t

    A = 12;
    B = 4;
    #t

    A = 13;
    B = 3;
    #t

    A = 14;
    B = 2;
    #t

    A = 15;
    B = 1;
    #t
    

    $stop;
    

end

endmodule