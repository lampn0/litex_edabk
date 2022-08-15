################################################################################
# IO constraints
################################################################################
# user_led:0
set_property LOC AB8 [get_ports {user_led0}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led0}]

# user_led:1
set_property LOC AA8 [get_ports {user_led1}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led1}]

# user_led:2
set_property LOC AC9 [get_ports {user_led2}]
set_property IOSTANDARD LVCMOS15 [get_ports {user_led2}]

# clk156:0.p
set_property LOC K28 [get_ports {clk156_p}]
set_property IOSTANDARD LVDS_25 [get_ports {clk156_p}]

# clk156:0.n
set_property LOC K29 [get_ports {clk156_n}]
set_property IOSTANDARD LVDS_25 [get_ports {clk156_n}]

################################################################################
# Design constraints
################################################################################

################################################################################
# Clock constraints
################################################################################


create_clock -name clk156_p -period 6.41 [get_ports clk156_p]

################################################################################
# False path constraints
################################################################################


set_false_path -quiet -through [get_nets -hierarchical -filter {mr_ff == TRUE}]

set_false_path -quiet -to [get_pins -filter {REF_PIN_NAME == PRE} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE || ars_ff2 == TRUE}]]

set_max_delay 2 -quiet -from [get_pins -filter {REF_PIN_NAME == C} -of_objects [get_cells -hierarchical -filter {ars_ff1 == TRUE}]] -to [get_pins -filter {REF_PIN_NAME == D} -of_objects [get_cells -hierarchical -filter {ars_ff2 == TRUE}]]