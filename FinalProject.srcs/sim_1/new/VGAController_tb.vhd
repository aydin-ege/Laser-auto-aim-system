----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2019 12:22:18 AM
-- Design Name: 
-- Module Name: VGAController_tb - Behavioral
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

entity VGAController_tb is
--  Port ( );
end VGAController_tb;

architecture Behavioral of VGAController_tb is
signal clk: std_logic := '0';
signal data: std_logic_vector(2 downto 0) := "000";
signal pixel_address : STD_LOGIC_VECTOR(17 downto 0);
signal VGA_RGB : STD_LOGIC_VECTOR(3 downto 0);
signal VGA_VSYNC : STD_LOGIC;
signal VGA_HSYNC : STD_LOGIC;
signal test : STD_LOGIC;
signal x : STD_LOGIC_VECTOR(9 downto 0);
signal y: STD_LOGIC_VECTOR(7 downto 0);
begin

clk <= not clk after 20ns;
data <= (others => '1');

VGACon : entity work.VGAController(RTL)
port map (
    i_VGA_clk => clk,
    i_pixel_data  => data,
    o_pixel_address => pixel_address,
    o_VGA_RGB => VGA_RGB,
    o_VGA_VSYNC => VGA_VSYNC,
    o_VGA_HSYNC => VGA_HSYNC,
    o_x => x,
    o_y => y,
    o_new_data => test
);







end Behavioral;
