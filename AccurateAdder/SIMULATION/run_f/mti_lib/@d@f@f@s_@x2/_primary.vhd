library verilog;
use verilog.vl_types.all;
entity DFFS_X2 is
    port(
        CK              : in     vl_logic;
        D               : in     vl_logic;
        SN              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFFS_X2;
