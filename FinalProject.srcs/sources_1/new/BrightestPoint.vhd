library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity BrightestPoint is
    Port (
           i_clk : in STD_LOGIC;
           i_clk_VGA : in STD_LOGIC;
           i_address : in STD_LOGIC_VECTOR (17 downto 0);
           i_data_1 : in STD_LOGIC_VECTOR (3 downto 0);
           i_data_2 : in STD_LOGIC_VECTOR (3 downto 0);
           i_new_data : in STD_LOGIC;
           i_x : in STD_LOGIC_VECTOR (9 downto 0);
           i_y : in STD_LOGIC_VECTOR (7 downto 0);
           o_coordinate_x : out STD_LOGIC_VECTOR (9 downto 0);
           o_coordinate_y : out STD_LOGIC_VECTOR (7 downto 0)
           );
end BrightestPoint;
 
architecture Behavioral of BrightestPoint is
    COMPONENT divider
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_divisor_tvalid : IN STD_LOGIC;
        s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
        s_axis_dividend_tvalid : IN STD_LOGIC;
        s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(55 DOWNTO 0)
      );
    END COMPONENT;


    signal s_count: unsigned(17 downto 0) :=  (others => '0');   
    signal s_result_count: std_logic_vector(23 downto 0) :=  (others => '1');
    signal s_totalX : unsigned(25 downto 0) := (others => '0');
    signal s_result_totalX, s_result_totalY : std_logic_vector(31 downto 0) := (others => '0');
    signal s_totalY : unsigned(25 downto 0) := (others => '0');
    signal s_coordinate_x: std_logic_vector(55 downto 0);
    signal s_coordinate_y: std_logic_vector(55 downto 0);
begin
    o_coordinate_x <= s_coordinate_x(33 downto 24);
    o_coordinate_y <= s_coordinate_y(31 downto 24);
    
    process(i_clk_VGA, i_new_data)
    begin
        if (rising_edge(i_clk_VGA) and i_new_data = '1') then
            if i_address = x"0000"&"00" then
                if s_count > 100 then           --threshold
                    s_result_totalY <= "000000" & std_logic_vector(s_totalY);
                    s_result_totalX <= "000000" & std_logic_vector(s_totalX);
                    s_result_count <= "000000" & std_logic_vector(s_count);
                end if;
                s_totalY <= (others => '0');
                s_totalX <= (others => '0');
                s_count <= (others => '0');
            else
                if abs(signed(i_data_1) - signed(i_data_2)) > 1 then --threshold
                    s_totalX <= s_totalX + unsigned(i_x);
                    s_totalY <= s_totalY + unsigned(i_y);
                    s_count <= s_count + 1;
                end if;
            end if;
           
        end if;
    end process;
 
    u_divider_x : divider
    PORT MAP (
        aclk => i_clk,
        s_axis_divisor_tvalid => '1',
        s_axis_divisor_tdata => s_result_count,
        s_axis_dividend_tvalid => '1',
        s_axis_dividend_tdata => s_result_totalX,
        m_axis_dout_tdata => s_coordinate_x
    );
    
    u_divider_y : divider
    PORT MAP (
        aclk => i_clk,
        s_axis_divisor_tvalid => '1',
        s_axis_divisor_tdata => s_result_count,
        s_axis_dividend_tvalid => '1',
        s_axis_dividend_tdata => s_result_totalY,
        m_axis_dout_tdata => s_coordinate_y
    );
 
end Behavioral;