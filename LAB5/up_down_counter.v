module UpDownCounter(clk, reset, control, count);

input clk, reset, control;
output [7:0] count;

reg ctrl;
reg [7:0] count;

always @(posedge clk)
    ctrl <= control;

always @(negedge clk or posedge reset) begin
    if(reset)
        count <= 0;
    else if(ctrl)
        count <= count + 1;
    else
        count <= count - 1;
end


endmodule