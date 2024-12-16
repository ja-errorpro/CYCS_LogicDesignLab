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

  initial begin
        clk = 0;
        forever #5 clk = ~clk;
  end

initial begin
  $monitor("Time: %0d | Money: %0d | Drink: %0d | Change: %0d | Cancel: %0d", 
           $time, money, drinkchoose, change, cancel);
end


  initial begin
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

    // Test Case 2: Cancel transaction
    #10 money = 6'd10; // Insert 10
    #10 money = 6'd5; // Insert 5
    #10 money = 6'd1; // Insert 1
    #10 cancel = 1; // Cancel transaction
    #10 cancel = 0; // Reset cancel


    #10 $stop;
  end
endmodule