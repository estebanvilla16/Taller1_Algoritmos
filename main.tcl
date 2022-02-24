package require Tcl 8.5

#TIMSORT ESTEBAN VILLA Y STEFANIA GARCIA

proc insertionsort {m} {
    for {set i 1} {$i < [llength $m]} {incr i} {
        set val [lindex $m $i]
        set j [expr {$i - 1}]
        while {$j >= 0 && [lindex $m $j] > $val} {
            lset m [expr {$j + 1}] [lindex $m $j]
            incr j -1
        }
        lset m [expr {$j + 1}] $val
    }
    return $m
    mergesort"m"
}
proc mergesort m {
    set len [llength $m]
    if {$len <= 1} {
        return $m
    }
    set middle [expr {$len / 2}]
    set left [lrange $m 0 [expr {$middle - 1}]]
    set right [lrange $m $middle end]
    return [merge [mergesort $left] [mergesort $right]]
}

proc merge {left right} {
    set result [list]
    while {[set lleft [llength $left]] > 0 && [set lright [llength $right]] > 0} {
        if {[lindex $left 0] <= [lindex $right 0]} {
            set left [lassign $left value]
        } else {
            set right [lassign $right value]
        }
        lappend result $value
    }
    if {$lleft > 0} {
        lappend result {*}$left
    }
    if {$lright > 0} {
        set result [concat $result $right] ;
    }
    return $result
    timSort"result"
}

proc timSort {result } {
    set RUN [llength $result]
    set mid [expr {$RUN / 2}]
    while {$mid > 0} {
        for {set i $mid} {$i < $RUN} {incr i} {
            set izq $i
            set temp [lindex $result $i]
            while {$izq >= $mid && [set val [lindex $result [expr {$izq - $mid}]]] > $temp} {
  
                lset result $izq $val
                incr izq -$mid
            }
            lset result $izq $temp
        }
        set mid [expr {$mid == 2 ? 1 : $mid * 2 / 11}]
    }
    return $result
} 
puts "Vector Desorganizado: "
puts "8 6 4 2 1 3 5 7 9 9 12 0 -4 -7 2"
puts "Resultado: " 
puts [timSort {8 6 4 2 1 3 5 7 9 9 12 0 -4 -7 2}] ;