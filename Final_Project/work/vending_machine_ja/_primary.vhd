library verilog;
use verilog.vl_types.all;
entity vending_machine_ja is
    generic(
        S0              : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        S1              : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        S2              : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        S3              : vl_logic_vector(0 to 1) := (Hi1, Hi1);
        TEA             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi1, Hi0);
        COKE            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1);
        COFFEE          : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi0, Hi1, Hi0, Hi0);
        MILK            : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi1, Hi0, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        money           : in     vl_logic_vector(5 downto 0);
        drinkchoose     : in     vl_logic_vector(2 downto 0);
        cancel          : in     vl_logic;
        change          : out    vl_logic_vector(5 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of S1 : constant is 1;
    attribute mti_svvh_generic_type of S2 : constant is 1;
    attribute mti_svvh_generic_type of S3 : constant is 1;
    attribute mti_svvh_generic_type of TEA : constant is 1;
    attribute mti_svvh_generic_type of COKE : constant is 1;
    attribute mti_svvh_generic_type of COFFEE : constant is 1;
    attribute mti_svvh_generic_type of MILK : constant is 1;
end vending_machine_ja;
