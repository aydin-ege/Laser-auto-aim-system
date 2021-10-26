----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2019 03:15:28 PM
-- Design Name: 
-- Module Name: calibrateServo_tb - Behavioral
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

entity calibrateServo_tb is
--  Port ( );
end calibrateServo_tb;

architecture Behavioral of calibrateServo_tb is
    signal s_clk : STD_LOGIC := '0';
    signal s_button_left : STD_LOGIC;
    signal s_button_right : STD_LOGIC;
    signal s_button_up : STD_LOGIC;
    signal s_button_down : STD_LOGIC;
    signal s_sw_topleft : STD_LOGIC;
    signal s_sw_bottomright : STD_LOGIC;
    signal s_servo_x_min : STD_LOGIC_VECTOR (7 downto 0);
    signal s_servo_x_max : STD_LOGIC_VECTOR (7 downto 0);
    signal s_servo_y_min : STD_LOGIC_VECTOR (7 downto 0);
    signal s_servo_y_max : STD_LOGIC_VECTOR (7 downto 0);
    signal s_servo_x_pos: STD_LOGIC_VECTOR(7 downto 0);
    signal s_servo_y_pos: STD_LOGIC_VECTOR(7 downto 0);
begin

UUT : entity work.calibrateServo(RTL)
    Port map ( 
           i_clk => s_clk,
           i_button_left => s_button_left,
           i_button_right => s_button_right,
           i_button_up => s_button_up,
           i_button_down => s_button_down,
           i_sw_set_topleft => s_sw_topleft,
           i_sw_set_bottomright => s_sw_bottomright,
           o_servo_x_min => s_servo_x_min,
           o_servo_x_max => s_servo_x_max,
           o_servo_y_min => s_servo_y_min,
           o_servo_y_max => s_servo_y_max,
           o_servo_x_pos => s_servo_x_pos,
           o_servo_y_pos => s_servo_y_pos
           );

    s_clk <= not s_clk after 5ns;
    process
    begin
        s_button_down <= '0';
        s_button_right <= '0';
        s_button_left <= '1';
        s_button_up <= '1';
        s_sw_topleft <= '0';
        s_sw_bottomright <= '0';
        wait for 1000ms;       
        s_button_down <= '1';
        s_button_right <= '1';
        s_button_left <= '0';
        s_button_up <= '0';
        s_sw_topleft <= '1';
        s_sw_bottomright <= '0';
        wait for 2000ms;
        s_button_down <= '0';
        s_button_right <= '0';
        s_button_left <= '0';
        s_button_up <= '0';
        s_sw_topleft <= '1';
        s_sw_bottomright <= '1';
        wait;
    end process;

end Behavioral;
