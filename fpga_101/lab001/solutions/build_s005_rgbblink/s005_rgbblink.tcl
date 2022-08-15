
# Create Project

create_project -force -name s005_rgbblink -part xc7k325t-ffg900-2
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

read_verilog {/home/lam/data2/edabk/fpga_101/lab001/solutions/build_s005_rgbblink/s005_rgbblink.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc s005_rgbblink.xdc
set_property PROCESSING_ORDER EARLY [get_files s005_rgbblink.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top s005_rgbblink -part xc7k325t-ffg900-2

# Synthesis report

report_timing_summary -file s005_rgbblink_timing_synth.rpt
report_utilization -hierarchical -file s005_rgbblink_utilization_hierarchical_synth.rpt
report_utilization -file s005_rgbblink_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file s005_rgbblink_utilization_hierarchical_place.rpt
report_utilization -file s005_rgbblink_utilization_place.rpt
report_io -file s005_rgbblink_io.rpt
report_control_sets -verbose -file s005_rgbblink_control_sets.rpt
report_clock_utilization -file s005_rgbblink_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force s005_rgbblink_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file s005_rgbblink_route_status.rpt
report_drc -file s005_rgbblink_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file s005_rgbblink_timing.rpt
report_power -file s005_rgbblink_power.rpt

# Bitstream generation

write_bitstream -force s005_rgbblink.bit 

# End

quit