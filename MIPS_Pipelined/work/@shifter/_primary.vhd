library verilog;
use verilog.vl_types.all;
entity Shifter is
    generic(
        \SLL\           : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        shamt           : in     vl_logic_vector(31 downto 0);
        \Signal\        : in     vl_logic_vector(5 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \SLL\ : constant is 1;
end Shifter;
