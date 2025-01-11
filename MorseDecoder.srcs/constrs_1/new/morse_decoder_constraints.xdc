# Boutons
set_property PACKAGE_PIN W19 [get_ports {lbutton_i}] #Bouton gauche
set_property PACKAGE_PIN T17 [get_ports {rbutton_i}] #Bouton droite

set_property IOSTANDARD LVCMOS33  [get_ports *button_i]

# Horloge
set_property PACKAGE_PIN W5 [get_ports {clk_i}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_i}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_i]

# Ecran LCD 7 segments
set_property PACKAGE_PIN W7 [get_ports {lcd_display_o[0]}]
set_property PACKAGE_PIN W6 [get_ports {lcd_display_o[1]}]
set_property PACKAGE_PIN U8 [get_ports {lcd_display_o[2]}]
set_property PACKAGE_PIN V8 [get_ports {lcd_display_o[3]}]
set_property PACKAGE_PIN U5 [get_ports {lcd_display_o[4]}]
set_property PACKAGE_PIN V5 [get_ports {lcd_display_o[5]}]
set_property PACKAGE_PIN U7 [get_ports {lcd_display_o[6]}]

set_property IOSTANDARD LVCMOS33  [get_ports {lcd_display_o[*]}]
