library verilog;
use verilog.vl_types.all;
entity UpDownCounter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        control         : in     vl_logic;
        count           : out    vl_logic_vector(7 downto 0)
    );
end UpDownCounter;
