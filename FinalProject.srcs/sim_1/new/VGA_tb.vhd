----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2019 10:07:13 PM
-- Design Name: 
-- Module Name: VGA_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_tb is
--  Port ( );
end VGA_tb;

architecture Behavioral of VGA_tb is
signal s_VSYNC : STD_LOGIC;
signal s_HSYNC : STD_LOGIC;
signal s_active_area : STD_LOGIC;
signal s_counter : integer := 0;
signal clk : STD_LOGIC := '0';
begin   
    clk <= not clk after 20ns;
    u_VGA : entity work.VGA(RTL)
    port map (
        i_clk => clk,
        o_VSYNC => s_VSYNC,
        o_HSYNC => s_HSYNC,
        o_active_area => s_active_area
    );
    process(clk)
    begin
        if (rising_edge(clk) and s_active_area='1') then
            s_counter <= s_counter +1;
        end if;
    end process;
end Behavioral;
