module DFF(q, d, clk, reset);
    input d, clk, reset;
    output q;
    reg q;
    
    always @(negedge clk or posedge reset)
        if (reset)
            q = 1'b0;
        else
            q = d;
endmodule

module MUX4_1(s0, s1, i0, i1, i2, i3, o);
    input s0, s1, i0, i1, i2, i3;
    output o;
    
    wire y0, y1, y2, y3;

    assign y0 = i0 & ~s1 & ~s0;
    assign y1 = i1 & ~s1 & s0;
    assign y2 = i2 & s1 & ~s0;
    assign y3 = i3 & s1 & s0;

    assign o = y0 | y1 | y2 | y3;

endmodule

module Shift_Register(i, s, o, clk, rst, r);

    input [7:0] i;
    input [1:0] s; // 00: hold, 01: shift left, 10: shift right, 11: parallel load
    input clk, rst, r;
    output [7:0] o;

    wire d0, d1, d2, d3, d4, d5, d6, d7;
    wire q0, q1, q2, q3, q4, q5, q6, q7;

    MUX4_1 m0(s[0], s[1], q0, r, q1, i[0], d0);
    MUX4_1 m1(s[0], s[1], q1, q0, q2, i[1], d1);
    MUX4_1 m2(s[0], s[1], q2, q1, q3, i[2], d2);
    MUX4_1 m3(s[0], s[1], q3, q2, q4, i[3], d3);
    MUX4_1 m4(s[0], s[1], q4, q3, q5, i[4], d4);
    MUX4_1 m5(s[0], s[1], q5, q4, q6, i[5], d5);
    MUX4_1 m6(s[0], s[1], q6, q5, q7, i[6], d6);
    MUX4_1 m7(s[0], s[1], q7, q6, r, i[7], d7);

    DFF dff0(q0, d0, clk, rst);
    DFF dff1(q1, d1, clk, rst);
    DFF dff2(q2, d2, clk, rst);
    DFF dff3(q3, d3, clk, rst);
    DFF dff4(q4, d4, clk, rst);
    DFF dff5(q5, d5, clk, rst);
    DFF dff6(q6, d6, clk, rst);
    DFF dff7(q7, d7, clk, rst);

    assign o = {q7, q6, q5, q4, q3, q2, q1, q0};


    

endmodule