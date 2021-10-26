----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2019 05:14:02 PM
-- Design Name: 
-- Module Name: VGAController - Behavioral
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

entity VGAController is
    Port ( i_VGA_clk : in STD_LOGIC;
           i_pixel_data : in STD_LOGIC_VECTOR(2 downto 0);
           i_average_x : in STD_LOGIC_VECTOR(9 downto 0);
           i_average_y : in STD_LOGIC_VECTOR(7 downto 0);
           o_pixel_address : out STD_LOGIC_VECTOR(17 downto 0); --This may be wrong, simulate!
           o_VGA_RGB : out STD_LOGIC_VECTOR(3 downto 0);
           o_VGA_VSYNC : out STD_LOGIC;
           o_VGA_HSYNC : out STD_LOGIC;
           o_x : out STD_LOGIC_VECTOR(9 downto 0);
           o_y : out STD_LOGIC_VECTOR(7 downto 0);
           o_new_data : out std_logic);
end VGAController;

architecture RTL of VGAController is
signal s_VSYNC : STD_LOGIC := '0';
signal s_HSYNC : STD_LOGIC := '0';
signal s_active_area : STD_LOGIC := '0';
signal s_address : unsigned(17 downto 0) := (others => '1');
signal s_pixelCounter : unsigned(11 downto 0) := x"280";
signal s_RGB : STD_LOGIC_VECTOR(3 downto 0);
signal s_x : unsigned(9 downto 0) := (others => '1');
signal s_y : unsigned(7 downto 0) := (others => '0');
signal s_double_line : std_logic := '1';
begin   
    u_VGA : entity work.VGA(RTL)
    port map (
        i_clk => i_VGA_clk,
        o_VSYNC => s_VSYNC,
        o_HSYNC => s_HSYNC,
        o_active_area => s_active_area
    );
    
    o_new_data <= s_active_area and s_double_line;
    o_VGA_VSYNC <= s_VSYNC;
    o_VGA_HSYNC <= s_HSYNC;
    s_RGB <= i_pixel_data & '0';
    o_pixel_address <= std_logic_vector(s_address);
    o_x <= std_logic_vector(s_x);
    o_y <= std_logic_vector(s_y);
        
    process(i_VGA_clk)
    begin
        if rising_edge(i_VGA_clk) then
            if s_active_area = '1' then
                s_address <= s_address + 1; --Might be a good idea to see whether or not this exceeds the threshold...
                s_x <= s_x + 1;
                o_VGA_RGB <= s_RGB;
                if std_logic_vector(s_x) = i_average_x or std_logic_vector(s_y) = i_average_y then
                    o_VGA_RGB <= (others => '1');
                end if;
                s_pixelCounter <= s_pixelCounter + 1;
                if s_pixelCounter = 1279 then
                    s_address <= s_address - 639;
                    --s_x <= (others => '1');
                    s_pixelCounter <= (others => '0');
                end if;
            else
                if s_x > 0 then
                    s_x <= (others => '0');
                    s_double_line <= not s_double_line;
                    if s_double_line = '0' then
                        s_y <= s_y + 1;
                    end if;
                end if;
                o_VGA_RGB <= (others => '0');
                if s_VSYNC = '0' then
                    s_address <= (others => '0');
                    s_x <= (others => '0');
                    s_y <= (others => '0');
                end if;
            end if;
        end if;
    end process;
        

end RTL;
















