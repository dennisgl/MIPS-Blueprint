library verilog;
use verilog.vl_types.all;
entity reg32 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en_reg          : in     vl_logic;
        d_in            : in     vl_logic_vector(31 downto 0);
        d_out           : out    vl_logic_vector(31 downto 0)
    );
end reg32;
