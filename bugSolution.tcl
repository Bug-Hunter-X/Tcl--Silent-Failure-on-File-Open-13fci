proc get_data {filename} {
    set fp [open $filename r]
    if {$fp == -1} {
        return -code error "Could not open file: $filename"
    }
    set data [read $fp]
    close $fp
    return $data
}

set data [get_data non_existent_file.txt]
if {[catch {puts $data} msg]} {
    puts stderr "Error: $msg"
}

#Alternative using try-catch

proc get_data2 {filename} {
    try {
        set fp [open $filename r]
        set data [read $fp]
        close $fp
        return $data
    } on error {msg} {
        return -code error $msg
    }
}

set data2 [get_data2 non_existent_file.txt]
if {[catch {puts $data2} msg]} {
    puts stderr "Error: $msg"
} 