
# Create Project

create_project -force -name s003_switches -part xc7k325t-ffg900-2
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

read_verilog {/home/lam/data2/edabk/fpga_101/lab001/solutions/build_s003_switches/s003_switches.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc s003_switches.xdc
set_property PROCESSING_ORDER EARLY [get_files s003_switches.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top s003_switches -part xc7k325t-ffg900-2

# Synthesis report

report_timing_summary -file s003_switches_timing_synth.rpt
report_utilization -hierarchical -file s003_switches_utilization_hierarchical_synth.rpt
report_utilization -file s003_switches_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file s003_switches_utilization_hierarchical_place.rpt
report_utilization -file s003_switches_utilization_place.rpt
report_io -file s003_switches_io.rpt
report_control_sets -verbose -file s003_switches_control_sets.rpt
report_clock_utilization -file s003_switches_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force s003_switches_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file s003_switches_route_status.rpt
report_drc -file s003_switches_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file s003_switches_timing.rpt
report_power -file s003_switches_power.rpt

# Bitstream generation

write_bitstream -force s003_switches.bit 

# End

quit