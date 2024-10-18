library verilog;
use verilog.vl_types.all;
entity Comparator is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        EQ              : out    vl_logic;
        GT              : out    vl_logic;
        LT              : out    vl_logic
    );
end Comparator;
