library verilog;
use verilog.vl_types.all;
entity mips_single is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end mips_single;
