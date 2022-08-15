
# Create Project

create_project -force -name s002_blink -part xc7k325t-ffg900-2
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

read_verilog {/home/lam/data2/edabk/fpga_101/lab001/solutions/build_s002_blink/s002_blink.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc s002_blink.xdc
set_property PROCESSING_ORDER EARLY [get_files s002_blink.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top s002_blink -part xc7k325t-ffg900-2

# Synthesis report

report_timing_summary -file s002_blink_timing_synth.rpt
report_utilization -hierarchical -file s002_blink_utilization_hierarchical_synth.rpt
report_utilization -file s002_blink_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file s002_blink_utilization_hierarchical_place.rpt
report_utilization -file s002_blink_utilization_place.rpt
report_io -file s002_blink_io.rpt
report_control_sets -verbose -file s002_blink_control_sets.rpt
report_clock_utilization -file s002_blink_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force s002_blink_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file s002_blink_route_status.rpt
report_drc -file s002_blink_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file s002_blink_timing.rpt
report_power -file s002_blink_power.rpt

# Bitstream generation

write_bitstream -force s002_blink.bit 

# End

quit