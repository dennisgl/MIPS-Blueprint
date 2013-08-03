library verilog;
use verilog.vl_types.all;
entity HiLo is
    port(
        clk             : in     vl_logic;
        MultAns         : in     vl_logic_vector(63 downto 0);
        HiOut           : out    vl_logic_vector(31 downto 0);
        LoOut           : out    vl_logic_vector(31 downto 0);
        reset           : in     vl_logic
    );
end HiLo;
