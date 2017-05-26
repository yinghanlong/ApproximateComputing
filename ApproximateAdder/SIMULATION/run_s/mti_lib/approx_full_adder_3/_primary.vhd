library verilog;
use verilog.vl_types.all;
entity approx_full_adder_3 is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Sum             : out    vl_logic;
        Cout            : out    vl_logic
    );
end approx_full_adder_3;
