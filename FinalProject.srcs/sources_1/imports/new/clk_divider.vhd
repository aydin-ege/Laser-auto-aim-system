library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity clk_divider is
    Port (
        i_clk    : in  STD_LOGIC;
        o_clk: out STD_LOGIC
    );
end clk_divider;
 
architecture RTL of clk_divider is
    signal s_clk: STD_LOGIC;
    signal s_counter : unsigned(9 downto 0) := (others => '0'); 
begin
    process (i_clk) begin
    if rising_edge(i_clk) then
            --64kHz
            if (s_counter = 780) then
                s_clk <= not s_clk;
                s_counter  <= (others => '0');
            else
                s_counter <= s_counter + 1;
            end if;
        end if;
    end process;
 
    o_clk <= s_clk;
end RTL;