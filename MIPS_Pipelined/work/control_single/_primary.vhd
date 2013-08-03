library verilog;
use verilog.vl_types.all;
entity control_single is
    generic(
        R_FORMAT        : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        LW              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        SW              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi1);
        BEQ             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        J               : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        BNE             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        ORI             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi1)
    );
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        ALUSrc          : out    vl_logic;
        MemtoReg        : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        Jump            : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0);
        BneDst          : out    vl_logic;
        ExtndDst        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of R_FORMAT : constant is 1;
    attribute mti_svvh_generic_type of LW : constant is 1;
    attribute mti_svvh_generic_type of SW : constant is 1;
    attribute mti_svvh_generic_type of BEQ : constant is 1;
    attribute mti_svvh_generic_type of J : constant is 1;
    attribute mti_svvh_generic_type of BNE : constant is 1;
    attribute mti_svvh_generic_type of ORI : constant is 1;
end control_single;
