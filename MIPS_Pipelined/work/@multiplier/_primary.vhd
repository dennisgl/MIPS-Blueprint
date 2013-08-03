library verilog;
use verilog.vl_types.all;
entity Multiplier is
    generic(
        s0              : integer := 0;
        s1              : integer := 1;
        s2              : integer := 2
    );
    port(
        clk             : in     vl_logic;
        dataA           : in     vl_logic_vector(31 downto 0);
        dataB           : in     vl_logic_vector(31 downto 0);
        dataOut         : out    vl_logic_vector(63 downto 0);
        \Signal\        : in     vl_logic_vector(6 downto 0);
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of s0 : constant is 1;
    attribute mti_svvh_generic_type of s1 : constant is 1;
    attribute mti_svvh_generic_type of s2 : constant is 1;
end Multiplier;
