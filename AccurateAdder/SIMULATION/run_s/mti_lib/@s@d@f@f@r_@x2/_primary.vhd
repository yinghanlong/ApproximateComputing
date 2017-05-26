library verilog;
use verilog.vl_types.all;
entity SDFFR_X2 is
    port(
        CK              : in     vl_logic;
        D               : in     vl_logic;
        RN              : in     vl_logic;
        SE              : in     vl_logic;
        SI              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end SDFFR_X2;
