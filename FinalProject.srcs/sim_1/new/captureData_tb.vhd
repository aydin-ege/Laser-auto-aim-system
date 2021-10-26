----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2019 02:22:12 PM
-- Design Name: 
-- Module Name: captureData_tb - Behavioral
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

entity captureData_tb is
--  Port ( );
end captureData_tb;

architecture RTL of captureData_tb is
signal clk : std_logic:='0';
signal href : std_logic:='0';
signal vsync : std_logic:='0';
signal data : std_logic_vector(7 downto 0) := "10101010";
signal address : std_logic_vector(17 downto 0);
signal output : std_logic_vector(2 downto 0);
signal we : std_logic;
begin
clk <= not clk after 5ns;
href <= not href after 33ns;

data <= std_logic_vector(unsigned(data) + 1) after 10ns; 
 
 u_cameraData : entity work.CameraDataCapture(RTL)
 port map (
    i_pixel_clk => clk,
    i_href => href,
    i_vsync => vsync,
    i_data => data,
    o_address => address,
    o_pixel => output,
    o_write_enable => we
 );

process
begin
    vsync <= '0';
    wait for 700ns;
    vsync <= '1';
    wait for 20ns;
    wait until href = '0';
    wait for 5ns;
    vsync <= '0';
end process;


end RTL;
