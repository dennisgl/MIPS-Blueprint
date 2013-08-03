library verilog;
use verilog.vl_types.all;
entity if_id is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en_reg          : in     vl_logic;
        add32_in        : in     vl_logic_vector(31 downto 0);
        add32_out       : out    vl_logic_vector(31 downto 0);
        insmem_in       : in     vl_logic_vector(31 downto 0);
        insmem_out      : out    vl_logic_vector(31 downto 0);
        jmpaddr_in      : in     vl_logic_vector(25 downto 0);
        jmpaddr_out     : out    vl_logic_vector(25 downto 0)
    );
end if_id;
