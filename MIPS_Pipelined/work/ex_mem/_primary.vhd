library verilog;
use verilog.vl_types.all;
entity ex_mem is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en_reg          : in     vl_logic;
        add32three_in   : in     vl_logic_vector(31 downto 0);
        add32three_out  : out    vl_logic_vector(31 downto 0);
        zero_in         : in     vl_logic;
        zero_out        : out    vl_logic;
        alu_in          : in     vl_logic_vector(31 downto 0);
        alu_out         : out    vl_logic_vector(31 downto 0);
        EMrd_out2       : out    vl_logic_vector(31 downto 0);
        EMrd_in2        : in     vl_logic_vector(31 downto 0);
        rfile_wn_in     : in     vl_logic_vector(4 downto 0);
        rfile_wn_out    : out    vl_logic_vector(4 downto 0);
        in_shiftCtl     : in     vl_logic;
        out_shiftCtl    : out    vl_logic;
        in_wb_regwrite  : in     vl_logic;
        in_wb_memtoreg  : in     vl_logic;
        in_m_branch     : in     vl_logic;
        in_m_memread    : in     vl_logic;
        in_m_mem        : in     vl_logic;
        out_wb_regwrite : out    vl_logic;
        out_wb_memtoreg : out    vl_logic;
        out_m_branch    : out    vl_logic;
        Jump_in         : in     vl_logic;
        Jump_out        : out    vl_logic;
        out_m_memread   : out    vl_logic;
        out_m_mem       : out    vl_logic;
        jmpaddr_in      : in     vl_logic_vector(31 downto 0);
        jmpaddr_out     : out    vl_logic_vector(31 downto 0);
        multi_data_in   : in     vl_logic_vector(63 downto 0);
        multi_data_out  : out    vl_logic_vector(63 downto 0);
        shifter_dataout_in: in     vl_logic_vector(31 downto 0);
        shifter_dataout_out: out    vl_logic_vector(31 downto 0)
    );
end ex_mem;
