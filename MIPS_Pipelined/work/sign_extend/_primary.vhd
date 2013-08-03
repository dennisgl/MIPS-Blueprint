library verilog;
use verilog.vl_types.all;
entity sign_extend is
    port(
        immed_in        : in     vl_logic_vector(15 downto 0);
        ext_immed_out   : out    vl_logic_vector(31 downto 0);
        extndDecide     : in     vl_logic
    );
end sign_extend;
