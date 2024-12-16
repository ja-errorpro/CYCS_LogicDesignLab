module stimulus;
    reg clk;
    reg [5:0] money;
    reg [2:0] drink_choose;
    reg cancel;
    wire [5:0] change;
    // wire [3:0] drink_out;

vending_machine_ja vm (
        .clk(clk),
        .money(money),
        .drinkchoose(drink_choose),
        .cancel(cancel),
        .change(change)
  );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        money = 0;
        drink_choose = 0;
        cancel = 0;
        #10 money = 10;
        #10 money = 5;
        #10 money = 1;
        #10 money = 10;
        #10 money = 0;

        #10 drink_choose = 3;
        #10 drink_choose = 0;

        #10 money = 10;
        #10 money = 5;
        #10 cancel = 1;
        #10 cancel = 0;
        
        #10 $stop;
    end
endmodule
