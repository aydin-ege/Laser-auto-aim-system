----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2019 11:01:25 AM
-- Design Name: 
-- Module Name: DebouncedReset - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DebouncedReset is
    Port ( i_clk : in STD_LOGIC;
           i_global_reset : in STD_LOGIC;
           o_reset : out STD_LOGIC
           );
end DebouncedReset;

architecture RTL of DebouncedReset is
    signal s_reset_counter : unsigned(15 downto 0) := (others => '0');
begin
    process(i_clk) --Debouncing
    begin
        if rising_edge(i_clk) then
            if i_global_reset = '0' then
                s_reset_counter <= (others => '0');
                o_reset <= '0';
            else
                if (s_reset_counter < x"FFFF") then
                    s_reset_counter <= s_reset_counter +1;
                    o_reset <= '0';
                else
                    o_reset <= '1';
                end if;
            end if;
        end if;
    end process;

end RTL;
