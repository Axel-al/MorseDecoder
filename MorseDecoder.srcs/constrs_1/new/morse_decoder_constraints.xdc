# Boutons
set_property PACKAGE_PIN W19 [get_ports {lbutton_i}]
set_property PACKAGE_PIN T17 [get_ports {rbutton_i}]
set_property PACKAGE_PIN U18 [get_ports {reset_i}]

set_property IOSTANDARD LVCMOS33  [get_ports *button_i]
set_property IOSTANDARD LVCMOS33  [get_ports reset_i]

# Horloge
set_property PACKAGE_PIN W5 [get_ports {clk_i}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk_i}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_i]

# Ecran LCD 7 segments
set_property PACKAGE_PIN W7 [get_ports {seg_display_o[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg_display_o[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg_display_o[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg_display_o[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg_display_o[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg_display_o[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg_display_o[6]}]

set_property IOSTANDARD LVCMOS33  [get_ports {seg_display_o[*]}]


# Pin pour sélectionner quel charactère parmis les 4 afficher
set_property PACKAGE_PIN U2 [get_ports {char_n_o[0]}]
set_property PACKAGE_PIN U4 [get_ports {char_n_o[1]}]
set_property PACKAGE_PIN V4 [get_ports {char_n_o[2]}]
set_property PACKAGE_PIN W4 [get_ports {char_n_o[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {char_n_o[*]}]