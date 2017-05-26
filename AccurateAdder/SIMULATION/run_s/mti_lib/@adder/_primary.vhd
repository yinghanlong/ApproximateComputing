library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        Sum             : out    vl_logic_vector(8 downto 0);
        clock           : in     vl_logic;
        X               : in     vl_logic_vector(7 downto 0);
        Y               : in     vl_logic_vector(7 downto 0);
        Cin             : in     vl_logic
    );
end Adder;
