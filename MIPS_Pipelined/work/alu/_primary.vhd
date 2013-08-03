library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        \AND\           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        \OR\            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        ADD             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        SUB             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        SLT             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        ANDI            : vl_logic_vector(0 to 2) := (HiX, HiX, HiX)
    );
    port(
        ctl             : in     vl_logic_vector(2 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \AND\ : constant is 1;
    attribute mti_svvh_generic_type of \OR\ : constant is 1;
    attribute mti_svvh_generic_type of ADD : constant is 1;
    attribute mti_svvh_generic_type of SUB : constant is 1;
    attribute mti_svvh_generic_type of SLT : constant is 1;
    attribute mti_svvh_generic_type of ANDI : constant is 1;
end alu;
