library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        clk             : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        wd              : in     vl_logic_vector(31 downto 0);
        addr            : in     vl_logic_vector(31 downto 0);
        rd              : out    vl_logic_vector(31 downto 0)
    );
end memory;
