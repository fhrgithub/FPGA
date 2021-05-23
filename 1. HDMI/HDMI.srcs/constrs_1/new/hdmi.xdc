set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN H16 [get_ports clk]
 
#set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
#set_property PACKAGE_PIN M15 [get_ports rst_n]
#############HDMI_O##################
set_property IOSTANDARD TMDS_33 [get_ports TMDS_CLK_n]
set_property PACKAGE_PIN L17 [get_ports TMDS_CLK_n]
 
set_property PACKAGE_PIN L16 [get_ports TMDS_CLK_p]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_CLK_p]
 
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_DATA_n[0]}]
set_property PACKAGE_PIN K18 [get_ports {TMDS_DATA_n[0]}]
 
set_property PACKAGE_PIN K17 [get_ports {TMDS_DATA_p[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_DATA_p[0]}]
 
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_DATA_n[1]}]
set_property PACKAGE_PIN J19 [get_ports {TMDS_DATA_n[1]}]
 
set_property PACKAGE_PIN K19 [get_ports {TMDS_DATA_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_DATA_p[1]}]
 
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_DATA_n[2]}]
set_property PACKAGE_PIN H18 [get_ports {TMDS_DATA_n[2]}]
 
set_property PACKAGE_PIN J18 [get_ports {TMDS_DATA_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_DATA_p[2]}]