----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2019 10:52:13 PM
-- Design Name: 
-- Module Name: CameraDataCapture - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity CameraDataCapture is
    Port ( --i_fast_clk : in STD_LOGIC;
           i_pixel_clk : in STD_LOGIC;
           i_HREF : in STD_LOGIC;
           i_VSYNC : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR (7 downto 0);
           i_pixel_select : in STD_LOGIC;
           o_address : out STD_LOGIC_VECTOR (17 downto 0);
           o_pixel : out STD_LOGIC_VECTOR (2 downto 0);
           o_write_enable : out STD_LOGIC);
end CameraDataCapture;

architecture RTL of CameraDataCapture is
    signal s_address : unsigned(17 downto 0) := (others => '0');
    signal s_line_count : STD_LOGIC := '0'; 
    signal s_pixel_count : STD_LOGIC := '0';
    signal s_write_enable : STD_LOGIC := '0';
    signal s_pixel_data : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal previous_HREF_pos : std_logic := '0';
begin
    o_write_enable <= s_write_enable;
    o_address <= std_logic_vector(s_address);
    o_pixel <= s_pixel_data;
    process(i_pixel_clk)
    begin
        s_write_enable <= '0';
        if rising_edge(i_pixel_clk) then
            if i_VSYNC = '1' then
                s_address <= (others => '0'); -- checking maximum address may be nice
            elsif (i_HREF and s_line_count) = '1' then
                s_pixel_count <= not s_pixel_count;
                if s_pixel_count = i_pixel_select then -- This may be zero... Take Y which is second byte
                    s_address <= s_address + 1;
                    s_pixel_data <= i_data(7 downto 5);
                    s_write_enable <= '1';
                end if;
            end if; 
        end if;
    end process;
    
    process(i_pixel_clk)
    begin
        if falling_edge(i_pixel_clk) then
            if previous_HREF_pos = '1' and i_HREF = '0' then
                s_line_count <= not s_line_count; --one of two lines
            end if;
            previous_HREF_pos <= i_HREF;
        end if;
    end process;
end RTL;
