library verilog;
use verilog.vl_types.all;
entity fetch is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        state           : in     vl_logic_vector(3 downto 0);
        pc              : out    vl_logic_vector(15 downto 0);
        npc             : out    vl_logic_vector(15 downto 0);
        rd              : out    vl_logic;
        taddr           : in     vl_logic_vector(15 downto 0);
        br_taken        : in     vl_logic
    );
end fetch;
