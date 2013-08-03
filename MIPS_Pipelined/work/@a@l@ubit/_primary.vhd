library verilog;
use verilog.vl_types.all;
entity ALUbit is
    generic(
        \AND\           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        \OR\            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        ADD             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        SUB             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        SLT             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        ai              : in     vl_logic;
        bi              : in     vl_logic;
        ci              : in     vl_logic;
        \Signal\        : in     vl_logic_vector(2 downto 0);
        bitOut          : out    vl_logic;
        cout            : out    vl_logic;
        less            : in     vl_logic;
        set             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \AND\ : constant is 1;
    attribute mti_svvh_generic_type of \OR\ : constant is 1;
    attribute mti_svvh_generic_type of ADD : constant is 1;
    attribute mti_svvh_generic_type of SUB : constant is 1;
    attribute mti_svvh_generic_type of SLT : constant is 1;
end ALUbit;
