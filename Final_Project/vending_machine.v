// This program is made by CompileErr0r, ja-errorpro.codes@Copyright

module vending_machine_ja(clk, money, drinkchoose, cancel, change);

input clk, cancel;
input [5:0] money;
input [2:0] drinkchoose;
output reg [5:0] change;


parameter S0 = 2'b00, // Initial state, waiting for money and display how much money is inserted
          S1 = 2'b01, // When money is over minimum, display the drink menu
          S2 = 2'b10, // When drink is selected, display the name of the drink
          S3 = 2'b11; // exchange money
          // when cancel, return money and return to S0

reg [1:0] current_state, next_state, prev_state;
reg prev_is_cancel;


// Price of drinks
parameter TEA = 6'd10,
          COKE = 6'd15,
          COFFEE = 6'd20,
          MILK = 6'd25;

reg [5:0] total_money;

initial begin
    total_money = 6'd0;
    current_state = S0;
    change = 6'd0;
end

always @(clk or posedge cancel or money) begin
    if(cancel) begin
        current_state <= S3;
    end
    else
        current_state <= next_state;
end

always @(current_state or cancel or total_money) begin
    // next_state = current_state;
    case(current_state)
        S0: begin
            prev_state = S0;
            if(cancel) begin 
                next_state = S3;
            end
            else if(total_money >= TEA)
                next_state = S1;
            else
                next_state = S0;
        end
        S1: begin
            prev_state = S1;
            if(money == 0 || (drinkchoose > 0 && drinkchoose < 5))
                next_state = S2;
            else
                next_state = S0;
        end
        S2: begin
            prev_state = S2;
            next_state = S3;
        end
        S3: begin
            prev_state = S3;
            next_state = S0;
        end
    endcase
end

always @(negedge clk or current_state or money) begin
    case(current_state)
        S0: begin
            if(money != 0 && cancel == 0 && prev_is_cancel == 0) begin
                total_money = total_money + money;
                $write("coin %d, total %d dollars ", money, total_money);
                if(total_money < TEA) $display("");
            end
            prev_is_cancel = 0;
        end
        S1: begin
            if(cancel == 0 && prev_state != S0 && next_state != S2) begin
                if(total_money >= MILK) $display("tea | coke | coffee | milk");
                else if(total_money >= COFFEE) $display("tea | coke | coffee");
                else if(total_money >= COKE) $display("tea | coke");
                else if(total_money >= TEA)  $display("tea");
                else $display("");
            end
        end
        S2: begin
            if(drinkchoose == 1 && total_money >= TEA) begin
                $display("tea out");
                total_money = total_money - TEA;
            end
            else if(drinkchoose == 2 && total_money >= COKE) begin
                $display("coke out");
                total_money = total_money - COKE;
            end
            else if(drinkchoose == 3 && total_money >= COFFEE) begin
                $display("coffee out");
                total_money = total_money - COFFEE;
            end
            else if(drinkchoose == 4 && total_money >= MILK) begin
                $display("milk out");
                total_money = total_money - MILK;
            end
        end
        S3: begin
            if(cancel) begin
                prev_is_cancel = 1;
                change = total_money;
                $display("\nexchange %d dollars", change);
                total_money = 6'd0;
                change = 6'd0;
            end
            else if(prev_state == S2) begin
                change = total_money;
                $display("exchange %d dollars", change);
                total_money = 6'd0;
                change = 6'd0;
            end
        end
    endcase

end




endmodule