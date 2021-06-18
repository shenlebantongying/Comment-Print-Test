#!/usr/bin/tclsh
# Copyright (c) 2021 shenlebantongying
# require tclib <https://www.tcl.tk/software/tcllib/>
# and tcl8.6
package require cmdline;

set options {
    {s.arg "" "Source  to read"}
    {c.arg "" "Command to run"}
}

set usage ": cpt.tcl -s source file -c command"

array set params [::cmdline::getoptions argv $options $usage]

if { $params(c) eq "" } { puts {Error! Need -c to specify command to run} ; exit 1}
if { $params(s) eq "" } { puts {Error! Need -s to specify source file} ; exit 1}

set source $params(s)
set commnd $params(c)
# parse source code
set sourceFile [split [read [open $source r]] "\n"]

set desiered {}
set cmdresut {}

foreach line $sourceFile {
    set nice ""
    regexp {\[\[(.*)\]\]} $line -> nice
    if { $nice ne ""} {
        lappend desiered [string trim $nice]
    }
}

# exec command
if {[catch {exec $commnd} result] == 0} {
    set r [split $result "\n"]
    foreach line $r {
        set trimed [string trim $line]
        if { [string trim $trimed] ne ""} {
            lappend cmdresut $trimed
        }
    }
} else {
    puts "Error! $commnd is invalid\n"
    exit 1
} 

if { [llength $desiered] eq [llength $cmdresut] } {
    set counter 0
    for {set i 0} {$i < [llength $desiered]} {incr i} {
        if {[lindex $desiered $i] == [lindex $cmdresut $i]} {
            puts "Passed -> [lindex $desiered $i]"
            set $counter [incr counter]
        } else {
            puts "Failed -> [lindex $desiered $i]"
        }
    }
    puts "Result: $counter/[llength $cmdresut] passed"
} else {
    puts "Error! Test and result number doesn't match!"
}

# TODO: make this file more elegant