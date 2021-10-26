set_property BITSTREAM.STARTUP.STARTUPCLK JTAGCLK [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property PACKAGE_PIN W5 [get_ports i_clk]
set_property IOSTANDARD LVCMOS33 [get_ports i_clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports i_clk]

set_property PACKAGE_PIN V17 [get_ports i_global_reset]
set_property IOSTANDARD LVCMOS33 [get_ports i_global_reset]
set_property PACKAGE_PIN V16 [get_ports i_data_pixel_select]
set_property IOSTANDARD LVCMOS33 [get_ports i_data_pixel_select]
set_property PACKAGE_PIN W16 [get_ports i_snapshot]
set_property IOSTANDARD LVCMOS33 [get_ports i_snapshot]


## OV7670 Camera header pins
##Pmod Header JB
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports o_camera_pwdn]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_pwdn]
set_property PULLUP true [get_ports o_camera_pwdn]
##Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {i_camera_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[0]}]
##Sch name = JB3
set_property PACKAGE_PIN B15 [get_ports {i_camera_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[2]}]
##Sch name = JB4
set_property PACKAGE_PIN B16 [get_ports {i_camera_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[4]}]
##Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports o_camera_reset]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_reset]
##Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {i_camera_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[1]}]
##Sch name = JB9
set_property PACKAGE_PIN C15 [get_ports {i_camera_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[3]}]
##Sch name = JB10
set_property PACKAGE_PIN C16 [get_ports {i_camera_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[5]}]


##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {i_camera_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[6]}]
##Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports o_camera_xCLK]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_xCLK]
##Sch name = JC3
set_property PACKAGE_PIN N17 [get_ports i_camera_HREF]
set_property IOSTANDARD LVCMOS33 [get_ports i_camera_HREF]
##Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports i_camera_pclk]
set_property IOSTANDARD LVCMOS33 [get_ports i_camera_pclk]
##Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {i_camera_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {i_camera_data[7]}]
##Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports io_camera_SIO_D]
set_property IOSTANDARD LVCMOS33 [get_ports io_camera_SIO_D]
set_property PULLUP true [get_ports io_camera_SIO_D]
##Sch name = JC9
set_property PACKAGE_PIN P17 [get_ports i_camera_VSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports i_camera_VSYNC]
##Sch name = JC10
set_property PACKAGE_PIN R18 [get_ports o_camera_SIO_C]
set_property IOSTANDARD LVCMOS33 [get_ports o_camera_SIO_C]


## CAMERA PORTS
set_property PACKAGE_PIN G19 [get_ports {o_VGA_R[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_R[0]}]
set_property PACKAGE_PIN H19 [get_ports {o_VGA_R[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_R[1]}]
set_property PACKAGE_PIN J19 [get_ports {o_VGA_R[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_R[2]}]
set_property PACKAGE_PIN N19 [get_ports {o_VGA_R[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_R[3]}]
set_property PACKAGE_PIN N18 [get_ports {o_VGA_B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_B[0]}]
set_property PACKAGE_PIN L18 [get_ports {o_VGA_B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_B[1]}]
set_property PACKAGE_PIN K18 [get_ports {o_VGA_B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_B[2]}]
set_property PACKAGE_PIN J18 [get_ports {o_VGA_B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_B[3]}]
set_property PACKAGE_PIN J17 [get_ports {o_VGA_G[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_G[0]}]
set_property PACKAGE_PIN H17 [get_ports {o_VGA_G[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_G[1]}]
set_property PACKAGE_PIN G17 [get_ports {o_VGA_G[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_G[2]}]
set_property PACKAGE_PIN D17 [get_ports {o_VGA_G[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_G[3]}]

set_property PACKAGE_PIN P19 [get_ports o_VGA_HSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_HSYNC]
set_property PACKAGE_PIN R19 [get_ports o_VGA_VSYNC]
set_property IOSTANDARD LVCMOS33 [get_ports o_VGA_VSYNC]

##SERVO PINS
set_property PACKAGE_PIN W19 [get_ports i_button_left]
set_property IOSTANDARD LVCMOS33 [get_ports i_button_left]
set_property PACKAGE_PIN T17 [get_ports i_button_right]
set_property IOSTANDARD LVCMOS33 [get_ports i_button_right]
set_property PACKAGE_PIN U17 [get_ports i_button_down]
set_property IOSTANDARD LVCMOS33 [get_ports i_button_down]
set_property PACKAGE_PIN T18 [get_ports i_button_up]
set_property IOSTANDARD LVCMOS33 [get_ports i_button_up]

set_property PACKAGE_PIN T1 [get_ports i_sw_set_topleft]
set_property IOSTANDARD LVCMOS33 [get_ports i_sw_set_topleft]
set_property PACKAGE_PIN R2 [get_ports i_sw_set_bottomright]
set_property IOSTANDARD LVCMOS33 [get_ports i_sw_set_bottomright]

##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports o_servo_pwm_x]
set_property IOSTANDARD LVCMOS33 [get_ports o_servo_pwm_x]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports o_servo_pwm_y]
set_property IOSTANDARD LVCMOS33 [get_ports o_servo_pwm_y]

create_clock -period 41.667 -name i_camera_pclk -waveform {0.000 20.834} [get_ports i_camera_pclk]
set_input_delay -clock i_camera_pclk 10.000 i_camera_data[*]
set_input_delay -clock i_camera_pclk -min 8.000 i_camera_data[*]
set_input_delay -clock i_camera_pclk -clock_fall 5.000 i_camera_HREF
set_input_delay -clock i_camera_pclk -clock_fall -min 0.000 i_camera_HREF
set_clock_latency -fall -min -source -1.250 i_camera_pclk
set_clock_latency -fall -max -source 1.250 i_camera_pclk
set_input_jitter i_camera_pclk 0.100


set_input_delay -clock [get_clocks i_camera_pclk] -min -add_delay 5.000 [get_ports i_camera_HREF]
set_input_delay -clock [get_clocks i_camera_pclk] -max -add_delay 5.000 [get_ports i_camera_HREF]
set_input_delay -clock [get_clocks i_camera_pclk] -min -add_delay 5.000 [get_ports i_camera_VSYNC]
set_input_delay -clock [get_clocks i_camera_pclk] -max -add_delay 5.000 [get_ports i_camera_VSYNC]
set_input_delay -clock [get_clocks i_clk] -min -add_delay 5.000 [get_ports io_camera_SIO_D]
set_input_delay -clock [get_clocks i_clk] -max -add_delay 5.000 [get_ports io_camera_SIO_D]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 5.000 [get_ports io_camera_SIO_D]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 5.000 [get_ports io_camera_SIO_D]
set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks i_clk] -group [get_clocks -include_generated_clocks sys_clk_pin]