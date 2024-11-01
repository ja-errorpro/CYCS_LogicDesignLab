library verilog;
use verilog.vl_types.all;
entity FullSubstractor is
    port(
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        z               : in     vl_logic;
        D               : out    vl_logic_vector(3 downto 0);
        B               : out    vl_logic_vector(3 downto 0)
    );
end FullSubstractor;
