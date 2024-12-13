module ALU(a, b, c, sel, clk, ret);

input [3:0] a, b, c;
input [2:0] sel;
input clk;

output reg [4:0] ret;

always @(posedge clk) begin
    
    case(sel)
        3'b000: begin
            if(a >= b && a >= c)
                ret = a;
            else if(b >= a && b >= c)
                ret = b;
            else
                ret = c;
        end
        3'b001: ret = a + b;
        3'b010: ret = a - b;
        3'b011: ret = a / b;
        3'b100: ret = a % b;
        3'b101: ret = a << 1;
        3'b110: ret = a >> 1;
        default: ret = a > b;
    endcase



end


endmodule