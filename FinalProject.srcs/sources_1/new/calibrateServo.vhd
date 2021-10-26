----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2019 01:26:51 PM
-- Design Name: 
-- Module Name: calibrateServo - RTL
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

entity calibrateServo is
    Port ( i_clk : in STD_LOGIC;
           i_button_left : in STD_LOGIC;
           i_button_right : in STD_LOGIC;
           i_button_up : in STD_LOGIC;
           i_button_down : in STD_LOGIC;
           i_sw_set_topleft : in STD_LOGIC;
           i_sw_set_bottomright : in STD_LOGIC;
           o_servo_x_min : out STD_LOGIC_VECTOR (7 downto 0);
           o_servo_x_max : out STD_LOGIC_VECTOR (7 downto 0);
           o_servo_y_min : out STD_LOGIC_VECTOR (7 downto 0);
           o_servo_y_max : out STD_LOGIC_VECTOR (7 downto 0);
           o_servo_x_pos: out STD_LOGIC_VECTOR(7 downto 0);
           o_servo_y_pos : out STD_LOGIC_VECTOR(7 downto 0)
           );
end calibrateServo;

architecture RTL of calibrateServo is
    signal s_pos_x  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal s_pos_y : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    o_servo_x_pos <= s_pos_x;
    o_servo_y_pos <= s_pos_y;   
    
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_sw_set_topleft = '0' then
                o_servo_x_min <= s_pos_x;
                o_servo_y_min <= s_pos_y;
            end if;
            if i_sw_set_bottomright = '0' then
                o_servo_x_max <= s_pos_x;
                o_servo_y_max <= s_pos_y;
            end if;
        end if;
    end process;

    u_button: entity work.button_to_pos(RTL)
    port map(
        i_reset => '0',
        i_clk => i_clk,
        i_button_inc => i_button_left,
        i_button_dec => i_button_right,
        o_pos => s_pos_x
    );
    
    u_button2: entity work.button_to_pos(RTL)
    port map(
        i_reset => '0',
        i_clk => i_clk,
        i_button_inc => i_button_down,
        i_button_dec => i_button_up,
        o_pos => s_pos_y
    );
end RTL;
