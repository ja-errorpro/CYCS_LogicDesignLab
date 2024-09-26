library verilog;
use verilog.vl_types.all;
entity TB is
    generic(
        t               : integer := 10;
        th              : integer := 5
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of t : constant is 1;
    attribute mti_svvh_generic_type of th : constant is 1;
end TB;
