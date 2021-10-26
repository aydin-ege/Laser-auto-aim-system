----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2019 04:34:44 PM
-- Design Name: 
-- Module Name: button_to_pos - Behavioral
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

entity button_to_pos is
    Port ( i_button_dec : in STD_LOGIC;
           i_button_inc : in STD_LOGIC;
           i_clk : in STD_LOGIC;
           i_reset : in STD_LOGIC;
           o_pos : out STD_LOGIC_VECTOR (7 downto 0));
end button_to_pos;

architecture RTL of button_to_pos is
    signal s_counter : unsigned (23 downto 0) := (others => '0');
    signal s_pos : unsigned (7 downto 0) := x"64";
begin
    process(i_clk, i_reset)
    begin
        if rising_edge(i_clk) then
            if i_reset='1' then
                s_counter <= (others => '0');
                s_pos <= x"64";
            elsif (i_button_inc = '1' and i_button_dec = '0') then
                s_counter <= s_counter + 1;
                if(s_counter >= 4380000) then
                    s_counter <= (others => '0');
                    if(200>s_pos) then
                        s_pos <= s_pos+1;
                    end if;
                end if;
            elsif (i_button_inc = '0' and i_button_dec = '1') then
                s_counter <= s_counter + 1;
                if(s_counter >= 4380000) then
                    s_counter <= (others => '0');
                    if(s_pos-1<s_pos) then
                        s_pos <= s_pos-1;
                    end if;
                end if;
            else
                s_counter <= (others => '0');
            end if;
        end if;
    end process;
    
    o_pos <= std_logic_vector(s_pos);

end RTL;
