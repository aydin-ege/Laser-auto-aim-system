----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2019 12:00:10 AM
---- Design Name: 
--    u_locationMapper_x: entity work.locationMapper(RTL)
--    generic map (
--        G_division_constant => 51
--    )
--    port map (
--        i_pixel_x 
--        i_servo_x_max 
--        i_servo_x_min 
--        o_servo_x 
--    );
-- Module Name: locationMapper - RTL
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

entity locationMapper is
    Generic (
            G_width : STD_LOGIC_VECTOR(31 downto 0)
            );

    Port    ( 
            i_clk : in STD_LOGIC;
            i_pixel_loc : in STD_LOGIC_VECTOR (9 downto 0);
            i_servo_max : in STD_LOGIC_VECTOR (7 downto 0);
            i_servo_min : in STD_LOGIC_VECTOR (7 downto 0);
            o_servo_loc : out STD_LOGIC_VECTOR (7 downto 0)
            );
end locationMapper;

architecture RTL of locationMapper is
    COMPONENT mult_gen_0
    PORT(
        CLK : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT map_divider
    PORT (
        aclk : IN STD_LOGIC;
        s_axis_divisor_tvalid : IN STD_LOGIC;
        s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_dividend_tvalid : IN STD_LOGIC;
        s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
      );
    END COMPONENT;

    signal s_difference : std_logic_vector(31 downto 0);
    signal s_product : std_logic_vector(31 downto 0);
    signal s_result : std_logic_vector(63 downto 0);
    signal s_servo_loc : std_logic_vector(31 downto 0);
begin
    s_difference <= std_logic_vector(signed(x"000000" & i_servo_max) - signed(x"000000" & i_servo_min)); --signed
    o_servo_loc <= s_servo_loc(7 downto 0);
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            s_servo_loc <= std_logic_vector(signed(s_result(63 downto 32)) + signed(x"000000" & i_servo_min)); --should be unsigned
        end if;
    end process;
    
    u_multiplier : mult_gen_0
    PORT MAP (
        CLK => i_clk,
        A => i_pixel_loc,  --unsigned
        B => s_difference, --signed
        P => s_product --signed
    );  
    u_divider : map_divider
    PORT MAP (
        aclk => i_clk,
        s_axis_divisor_tvalid => '1',
        s_axis_divisor_tdata => G_width,
        s_axis_dividend_tvalid => '1',
        s_axis_dividend_tdata => s_product,
        m_axis_dout_tdata => s_result
      );

    
end RTL;
