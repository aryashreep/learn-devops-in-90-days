#!/bin/bash
# pipes + awk to pull specific columns out of system commands

check_memory() {
    free -h | awk 'NR==2 {print "Available memory: " $7}'
}

check_storage() {
    df -h / | awk 'NR==2 {print "Available disk: " $4}'
}

top_process() {
    ps aux --sort=-%mem | awk 'NR==2 {print "Top memory process: user="$1" pid="$2" mem%="$4}'
}

echo "=== System Details ==="
check_memory
check_storage
top_process
