----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2019 10:52:13 PM
-- Design Name: 
-- Module Name: TopModule - Behavioral
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

entity TopModule is
    Port ( i_clk : in STD_LOGIC;
           i_snapshot : in STD_LOGIC;
           i_button_left : in STD_LOGIC;
           i_button_right : in STD_LOGIC;
           i_button_up : in STD_LOGIC;
           i_button_down : in STD_LOGIC;
           i_sw_set_topleft : in STD_LOGIC;
           i_sw_set_bottomright : in STD_LOGIC;
           i_camera_VSYNC : in STD_LOGIC;
           i_camera_HREF : in STD_LOGIC;
           i_camera_data : in STD_LOGIC_VECTOR (7 downto 0);
           i_camera_pclk : in STD_LOGIC;
           i_global_reset : in STD_LOGIC;
           i_data_pixel_select : in STD_LOGIC;
           io_camera_SIO_D : inout STD_LOGIC;
           o_camera_SIO_C : out STD_LOGIC;
           o_camera_xCLK : out STD_LOGIC;
           o_camera_reset : out STD_LOGIC; 
           o_camera_pwdn : out STD_LOGIC; 
           o_VGA_VSYNC : out STD_LOGIC;
           o_VGA_HSYNC : out STD_LOGIC;
           o_VGA_R : out STD_LOGIC_VECTOR(3 downto 0);
           o_VGA_G : out STD_LOGIC_VECTOR(3 downto 0);
           o_VGA_B : out STD_LOGIC_VECTOR(3 downto 0);
           o_servo_pwm_x : out STD_LOGIC;
           o_servo_pwm_y : out STD_LOGIC
           );
end TopModule;

architecture RTL of TopModule is
    COMPONENT oddr_xCLK
    PORT (
        clk_in : IN STD_LOGIC;
        clk_out : OUT STD_LOGIC
    );
    END COMPONENT;
    component ClockController
    port(
      clk_out1          : out    std_logic;
      clk_out2          : out    std_logic;
      clk_out3          : out    std_logic;
      reset             : in     std_logic;
      locked            : out    std_logic;
      clk_in1           : in     std_logic
      );
    end component;
    
    COMPONENT frameBuffer
    PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        clkb : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT initialFrame
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        clkb : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT ov7670_init
    PORT(
        iCLK : in STD_LOGIC;		
        iRST_N : in STD_LOGIC;	
        
        I2C_SCLK : out STD_LOGIC;
        I2C_SDAT : inout STD_LOGIC;	
        Config_Done : out STD_LOGIC;
        I2C_RDATA : out STD_LOGIC_VECTOR(7 downto 0)
    );
    END COMPONENT;
    
    -- CLOCKING SIGNALS BEGIN --
    signal s_locked : std_logic;
    signal s_clk_24MHz : std_logic;
    signal s_clk_25MHz : std_logic;
    signal s_clk_100MHz : std_logic;
    -- CLOCKING SIGNALS END --
    
    -- DATA CAPTURE SIGNALS BEGIN --
    signal s_pixel_address : std_logic_vector(17 downto 0);
    signal s_pixel_data : std_logic_vector(2 downto 0);
    signal s_write_enable : std_logic_vector(0 downto 0);
    -- DATA CAPTURE SIGNALS END --
    
    -- VGA SIGNALS BEGIN --
    signal s_frame_pixel_data : std_logic_vector(3 downto 0);
    signal s_frame_pixel_data1 : std_logic_vector(3 downto 0) := x"0";
    signal s_frame_pixel_data2 : std_logic_vector(3 downto 0) := x"0";
    signal s_frame_pixel_address : std_logic_vector(17 downto 0);
    signal s_VGA_RGB : std_logic_vector(3 downto 0);
    -- VGA SIGNALS END --
    
    -- DEBOUNCER SIGNALS BEGIN --
    signal s_reset : std_logic := '0';
    -- DEBOUNCER SIGNALS END --
    
    -- BRIGHTES POINT DETECTOR SIGNALS BEGIN --
    signal s_pixel_avg_y : std_logic_vector(7 downto 0);
    signal s_pixel_avg_x : std_logic_vector(9 downto 0);
    signal s_x : std_logic_vector(9 downto 0);
    signal s_y : std_logic_vector(7 downto 0);
    signal s_new_data : std_logic;
    -- BRIGHTES POINT DETECTOR SIGNALS END --
    
    -- SERVO CALIBRATION SIGNALS BEGIN --
    signal s_servo_x_min : STD_LOGIC_VECTOR (7 downto 0);
    signal s_servo_x_max : STD_LOGIC_VECTOR (7 downto 0);
    signal s_servo_y_min : STD_LOGIC_VECTOR (7 downto 0);
    signal s_servo_y_max : STD_LOGIC_VECTOR (7 downto 0);
    signal s_calibration_x_pos : STD_LOGIC_VECTOR(7 downto 0);
    signal s_calibration_y_pos : STD_LOGIC_VECTOR(7 downto 0);
    -- SERVO CALIBRATION SIGNALS END --
    
    -- LOCATION MAPPER SIGNALS BEGIN --
    signal s_mapped_x_pos : STD_LOGIC_VECTOR(7 downto 0);
    signal s_mapped_y_pos : STD_LOGIC_VECTOR(7 downto 0);
    -- LOCATION MAPPER SIGNALS END --
    
    -- SERVO DRIVER SIGNALS BEGIN --
    signal s_servo_x_pos : STD_LOGIC_VECTOR(7 downto 0);
    signal s_servo_y_pos : STD_LOGIC_VECTOR(7 downto 0);
    -- SERVO DRIVER SIGNALS END --
    
begin
    u_ClockController : ClockController
    port map ( 
        clk_out1 => s_clk_24MHz,
        clk_out2 => s_clk_25MHz,   
        clk_out3 => s_clk_100MHz,           
        reset => '0',
        locked => s_locked,
        clk_in1 => i_clk
    );
    o_camera_pwdn <= not s_locked;
    o_camera_reset <= s_locked;
    
    u_DebouncedReset : entity work.DebouncedReset(RTL)
    port map (
        i_clk => s_clk_100MHz,
        i_global_reset => i_global_reset,
        o_reset => s_reset
    );
    
    u_oddr : oddr_xCLK
    PORT MAP (
        clk_in => s_clk_24MHz, -- maybe increase later
        clk_out => o_camera_xCLK
    );
    
    u_CameraController : ov7670_init
    port map (		
        iRST_N => s_reset,
        iCLK => s_clk_100MHz,
        I2C_SDAT => io_camera_SIO_D,
        I2C_SCLK => o_camera_SIO_C
    );
    

    
    u_CameraDataCapture : entity work.CameraDataCapture(RTL)
    port map (
        --i_fast_clk => s_clk_100MHz,
        i_pixel_clk => i_camera_pclk,
        i_HREF => i_camera_HREF,
        i_VSYNC => i_camera_VSYNC,
        i_data => i_camera_data, 
        i_pixel_select => i_data_pixel_select,
        o_address => s_pixel_address,
        o_pixel => s_pixel_data,
        o_write_enable => s_write_enable(0)
    );
    
    u_frameBuffer : frameBuffer 
    PORT MAP (
        clka => i_camera_pclk,
        wea => s_write_enable,
        addra => s_pixel_address,
        dina => s_pixel_data,
        clkb => s_clk_25MHz,
        addrb => s_frame_pixel_address,
        doutb => s_frame_pixel_data1(2 downto 0)
    );
    
    u_initial_frame : initialFrame
    PORT MAP (
        clka => i_camera_pclk,
        wea => s_write_enable,
        addra => s_pixel_address,
        dina => s_pixel_data,
        ena => i_snapshot,
        clkb => s_clk_25MHz,
        addrb => s_frame_pixel_address,
        doutb => s_frame_pixel_data2(2 downto 0)
  );
    s_frame_pixel_data <= std_logic_vector(abs(signed(s_frame_pixel_data1) - signed(s_frame_pixel_data2)));
    
    u_VGAController : entity work.VGAController(RTL)
    port map(
        i_VGA_clk => s_clk_25MHz,
        i_pixel_data => s_frame_pixel_data(2 downto 0),
        i_average_x => s_pixel_avg_x,
        i_average_y => s_pixel_avg_y,
        o_pixel_address => s_frame_pixel_address,
        o_VGA_RGB => s_VGA_RGB,
        o_VGA_VSYNC => o_VGA_VSYNC,
        o_VGA_HSYNC => o_VGA_HSYNC,
        o_new_data => s_new_data,
        o_x => s_x,
        o_y => s_y
    );
        
    o_VGA_R <= s_VGA_RGB;
    o_VGA_G <= s_VGA_RGB;
    o_VGA_B <= s_VGA_RGB;
    
    
    u_BrightestPoint: entity work.BrightestPoint(Behavioral)
    port map(
        i_clk => s_clk_100MHz,
        i_clk_VGA => s_clk_25MHz,
        i_address => s_frame_pixel_address,
        i_data_1 => s_frame_pixel_data1,
        i_data_2 => s_frame_pixel_data2,
        i_x => s_x,
        i_y => s_y,
        i_new_data => s_new_data,
        o_coordinate_x => s_pixel_avg_x,
        o_coordinate_y => s_pixel_avg_y
    );
    
    u_calibrateServo : entity work.calibrateServo(RTL)
    Port map ( 
       i_clk => s_clk_100MHz,
       i_button_left => i_button_left,
       i_button_right => i_button_right,
       i_button_up => i_button_up,
       i_button_down => i_button_down,
       i_sw_set_topleft => i_sw_set_topleft,
       i_sw_set_bottomright => i_sw_set_bottomright,
       o_servo_x_min => s_servo_x_min,
       o_servo_x_max => s_servo_x_max,
       o_servo_y_min => s_servo_y_min,
       o_servo_y_max => s_servo_y_max,
       o_servo_x_pos => s_calibration_x_pos,
       o_servo_y_pos => s_calibration_y_pos
    );
    
    u_locationMapper_x : entity work.locationMapper(RTL)
    Generic map (
        G_width => x"00000280" --640
    )
    Port map (
        i_clk => s_clk_100MHz,
        i_pixel_loc => s_pixel_avg_x,
        i_servo_max => s_servo_x_max,
        i_servo_min => s_servo_x_min,
        o_servo_loc => s_mapped_x_pos
    );
    u_locationMapper_y : entity work.locationMapper(RTL)
    Generic map (
        G_width => x"000000f0" --240
    )
    Port map (
        i_clk => s_clk_100MHz,
        i_pixel_loc(9 downto 8) => "00",
        i_pixel_loc(7 downto 0) => s_pixel_avg_y,
        i_servo_max => s_servo_y_max,
        i_servo_min => s_servo_y_min,
        o_servo_loc => s_mapped_y_pos
    ); 
    
    with std_logic_vector'(i_sw_set_topleft&i_sw_set_bottomright) select s_servo_x_pos <= 
        s_calibration_x_pos when "01"|"10"|"00",
        s_mapped_x_pos when others;
    
    with std_logic_vector'(i_sw_set_topleft&i_sw_set_bottomright) select s_servo_y_pos <= 
        s_calibration_y_pos when "01"|"10"|"00",
        s_mapped_y_pos when others;
        
    
    u_servo_x : entity work.servo(RTL) 
    port map(
        i_clk => s_clk_100MHz,  
        i_pos => s_servo_x_pos, 
        o_pwm => o_servo_pwm_x
    );
    
    u_servo_y : entity work.servo(RTL) 
    port map(
        i_clk => s_clk_100MHz, 
        i_pos => s_servo_y_pos, 
        o_pwm => o_servo_pwm_y
    );
    
end RTL;
