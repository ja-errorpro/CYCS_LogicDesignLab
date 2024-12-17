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

        // Test 1: Example testcase
        #10 money = 10;
        #10 money = 5;
        #10 money = 1;
        #10 money = 10;
        #10 money = 0;

        #10 drink_choose = 3;
        #10 drink_choose = 0;
/*
        // Test 2: Cancel the transcation
        #10 money = 10;
        #10 money = 5;
        #10 cancel = 1;
        #10 cancel = 0;

        // Test 3: After cancel, insert duplicate money and choose a drink
        #10 money = 5;
        #10 money = 10;
        #10 money = 10;
        #10 money = 0;
        #10 drink_choose = 2;
        #10 drink_choose = 0;
        
        // Test 4: Idle, and cancel
        #50 
        #10 money = 1;
        #10 cancel = 1;
        #10 cancel = 0;

        // Test 5: Insert many 1 dollars
        #10 money = 1;
        #500 money = 0;
        #10 drink_choose = 4;
        #10 drink_choose = 0;
*/

        #10 $stop;
    end
endmodule
