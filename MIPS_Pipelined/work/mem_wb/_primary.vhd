library verilog;
use verilog.vl_types.all;
entity mem_wb is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en_reg          : in     vl_logic;
        alutwo_in       : in     vl_logic_vector(31 downto 0);
        alutwo_out      : out    vl_logic_vector(31 downto 0);
        DataMemoryRd_out: out    vl_logic_vector(31 downto 0);
        DataMemoryRd_in : in     vl_logic_vector(31 downto 0);
        rfile_wn_in     : in     vl_logic_vector(4 downto 0);
        rfile_wn_out    : out    vl_logic_vector(4 downto 0);
        in_shiftCtl     : in     vl_logic;
        out_shiftCtl    : out    vl_logic;
        MW_MemtoReg_in  : in     vl_logic;
        MW_RegWrite_in  : in     vl_logic;
        MW_MemtoReg_out : out    vl_logic;
        MW_RegWrite_out : out    vl_logic;
        shifter_dataout_in: in     vl_logic_vector(31 downto 0);
        shifter_dataout_out: out    vl_logic_vector(31 downto 0)
    );
end mem_wb;
