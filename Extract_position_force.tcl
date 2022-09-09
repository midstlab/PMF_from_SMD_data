### Tamayjp.PMF protocol
###Open the log file for reading and the output .dat file for writing
for { set a 1}  {$a < 71} {incr a} {

set file [open wLIG/wLIG-${a}.out r] 
set output [open wLIG_positions/position_wLIG-${a}.dat w]

### Gather input from user.
#puts "Enter a value for n_x:"
set nx -0.0201848 
#puts "Enter a value for n_y:"
set ny 0.5163 
#puts "Enter a value for n_z:"
set nz -0.85617


### Loop over all lines of the log file
set file [open wLIG/wLIG-${a}.out r]
while { [gets $file line] != -1 } {

### Determine if a line contains SMD output. If so, write the
### timestep followed by f(dot)n to the output file
  if {[lindex $line 0] == "SMD"} {
      puts $output "[expr $nx*[lindex $line 2] + $ny*[lindex $line 3] + $nz*[lindex $line 4]] [expr $nx*[lindex $line 5] + $ny*[lindex $line 6] + $nz*[lindex $line 7]]"
    }
  }
}

### Close the log file and the output .dat file
close $file
close $output

#### First column: position of SMD atom  projected on the pulling direction (Å)
#### Second column: force projected on the pulling direction (kcal/mol/Å)


