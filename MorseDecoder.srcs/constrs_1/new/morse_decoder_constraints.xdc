# Constraints File (constraints.xdc)

# Boutons
set_property PACKAGE_PIN P1 [get_ports {button1}]
set_property IOSTANDARD LVCMOS33 [get_ports {button1}]

set_property PACKAGE_PIN P2 [get_ports {button2}]
set_property IOSTANDARD LVCMOS33 [get_ports {button2}]

# Horloge
set_property PACKAGE_PIN P3 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# Ecran LCD 7 segments
set_property PACKAGE_PIN P4 [get_ports {lcd_display[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_display[0]}]

# Ajoutez des propriétés pour lcd_display[1] à lcd_display[6]
