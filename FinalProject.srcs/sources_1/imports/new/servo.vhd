library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo is
    PORT (
        i_pos   : IN  STD_LOGIC_VECTOR(7 downto 0); --0-200 
        i_clk   : IN  STD_LOGIC;
        o_pwm : OUT STD_LOGIC
    );
end servo;

architecture RTL of servo is
    signal s_blank_time_counter : unsigned(23 downto 0) := (others => '0');
    signal s_pulse_counter : unsigned(19 downto 0) := (others => '0');
begin
    process(i_clk)
        variable v_timing: Integer := 0;
        variable v_start_pulse: Boolean := false;
    begin
        if rising_edge(i_clk) then
            v_timing := to_integer(unsigned(i_pos))*1024 + 50000;
            s_blank_time_counter <= s_blank_time_counter + 1;
            if (s_blank_time_counter = 2000000 or v_start_pulse) then
                s_pulse_counter <= s_pulse_counter + 1;
                if not v_start_pulse then
                    v_start_pulse := true;
                    s_blank_time_counter <= (others => '0');
                    o_pwm <= '1';
                end if;
                if (s_pulse_counter > v_timing) then
                    o_pwm <= '0';
                    s_pulse_counter <= (others => '0');
                    v_start_pulse := false;
                end if;
            end if;
        end if;
    end process;
    
    
end RTL;