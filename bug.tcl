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
puts $data