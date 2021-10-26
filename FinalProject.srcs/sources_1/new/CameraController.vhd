----------------------------------------------------------------------------------
-- Engineer: Ege Aydýn
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Create Date: 11/26/2019 10:52:13 PM
-- Design Name: 
-- Module Name: CameraController - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Part of the code is retrieved from an open source project at
--              https://www.fpga4student.com/2018/08/basys-3-fpga-ov7670-camera.html
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

entity CameraController is
    Port ( i_camera_clk : in STD_LOGIC;
           io_SIO_D : inout STD_LOGIC;
           o_SIO_C : out STD_LOGIC;
           o_xCLK : out STD_LOGIC;
           o_reset : out STD_LOGIC;
           o_pwdn : out STD_LOGIC;
           o_setup_complete : out STD_LOGIC);
end CameraController;

architecture Behavioral of CameraController is
    signal sys_clk  : std_logic := '0';	
	signal command  : std_logic_vector(15 downto 0);
	signal finished : std_logic := '0';
	signal taken    : std_logic := '0';
	signal send     : std_logic;
	constant camera_address : std_logic_vector(7 downto 0) := x"42"; -- 42"; -- Device write ID - see top of page 11 of data sheet
begin
    o_setup_complete <= finished;
	send <= not finished;
	o_reset <= '1'; 						-- Normal mode
	o_pwdn  <= '0'; 						-- Power device up
	o_xCLK  <= sys_clk;
	
    process(i_camera_clk)
	begin
		if rising_edge(i_camera_clk) then
			sys_clk <= not sys_clk;  -- Divide by 2 for some reason
		end if;
	end process;

	
	Inst_i2c_sender: entity work.i2c_sender(Behavioral) 
	PORT MAP(
		clk   => i_camera_clk,
		taken => taken,
		siod  => io_SIO_D,
		sioc  => o_SIO_C,
		send  => send,
		id    => camera_address,
		reg   => command(15 downto 8),
		value => command(7 downto 0)
	);
	
	Inst_ov7670_registers: entity work.ov7670_registers(Behavioral)
	PORT MAP(
		clk      => i_camera_clk,
		advance  => taken,
		command  => command,
		finished => finished
	);
end Behavioral;
