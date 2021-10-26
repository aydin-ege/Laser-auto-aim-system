----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2019 10:52:13 PM
-- Design Name: 
-- Module Name: VGA - Behavioral
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

entity VGA is
    Port ( i_clk : in STD_LOGIC;
           o_VSYNC : out STD_LOGIC := '1';
           o_HSYNC : out STD_LOGIC := '1';
           o_active_area : out STD_LOGIC);
end VGA;

architecture RTL of VGA is
    signal s_HCounter : unsigned(9 downto 0) := (others=> '0');
    signal s_VCounter : unsigned(9 downto 0) := (others=> '0');
    signal s_VActive : STD_LOGIC := '1';
    signal s_HActive : STD_LOGIC := '1';
begin
    o_active_area<= s_VActive and s_HActive;
    
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            s_HCounter <= s_HCounter + 1;
            s_HActive <= '0';
            
            if s_HCounter = 0 then
                s_VCounter <= s_Vcounter + 1;
                s_VActive <= '0';
         
                if s_VCounter < 480 then
                    s_VActive <= '1';
                elsif s_VCounter < 490 then
                elsif s_VCounter < 492 then
                    o_VSYNC <= '0';
                elsif s_VCounter < 525-1 then
                    o_VSYNC <= '1';
                else
                    s_VCounter <= (others => '0');
                end if; 
            end if;
            if s_HCounter < 640 then --check numbers, may be wrong
                s_HActive <= '1';
            elsif s_HCounter < 656 then
            elsif s_HCounter < 752 then
                o_HSYNC <= '0';
            elsif s_HCounter < 800-1 then
                o_HSYNC <= '1';
            else
                s_HCounter <= (others=> '0');
            end if;
        end if;
    end process;
end RTL;

