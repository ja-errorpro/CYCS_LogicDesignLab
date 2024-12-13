`timescale 1ns/1ns
module Stimulus;

  reg clk, cancel;
  reg [5:0] money;
  reg [2:0] drinkchoose;
  wire [5:0] change;

  // FSM vm (.clk(clk), .drinkchoose(drinkchoose), .money(money), .cancel(cancel), .change(change));
  vending_machine_ja vm (
        .clk(clk),
        .money(money),
        .drinkchoose(drinkchoose),
        .cancel(cancel),
        .change(change)
  );

  always #5 clk = ~clk; // Generate clock signal

initial begin
  $monitor("Time: %0d | Money: %0d | Drink: %0d | Change: %0d | Cancel: %0d", 
           $time, money, drinkchoose, change, cancel);
end


  initial begin
    clk = 0;
    cancel = 0;
    money = 6'd0;
    drinkchoose = 3'd0;
    // Test Case 1: Insert money and select drink
    #10 money = 6'd10; // Insert 10
    #10 money = 6'd5; // Insert 5
    #10 money = 6'd1; // Insert 1
    #10 money = 6'd10; // Insert 10
    #10 money = 6'd0; // No money
    #10 drinkchoose = 3'd3; // Choose coffee (price: 20)
    #10 drinkchoose = 3'd0; // Reset choice

    // Test Case 4: Insert excessive money and select milk
    #10 money = 6'd50; // Insert 50
    #10 drinkchoose = 3'd4; // Choose milk (price: 25)
    #10 drinkchoose = 3'd0; // Reset choice

    // Test Case 5: Select invalid drink
    #10 drinkchoose = 3'd5; // Invalid selection
    #10 drinkchoose = 3'd0; // Reset choice

    // Test Case 7: Cancel
    #10 money = 6'd10; // Insert 10
    #10 cancel = 1; // Cancel transaction
    #10 cancel = 0;

    // Test Case 8: No money, select drink or cancel
    #10 drinkchoose = 3'd2; // Choose coke (price: 15)
    #10 drinkchoose = 3'd0; // Reset choice

    $stop;
  end
endmodule