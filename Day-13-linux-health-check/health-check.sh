#!/bin/bash

# =====================================
# DevOps Health Check Script
# Author: Nisha Yadav
# =====================================

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}"
    echo "=============================================="
    echo "         DEVOPS HEALTH CHECK REPORT"
    echo "=============================================="
    echo -e "${NC}"
}

system_info() {

    echo -e "${YELLOW}System Information${NC}"
    echo "--------------------------------------"

    OS_NAME=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')

    echo "Hostname      : $(hostname)"
    echo "Current Time  : $(date)"
    echo "Operating Sys : $OS_NAME"
    echo "Kernel Version: $(uname -r)"
    echo "Uptime        : $(uptime -p)"

    echo
}

cpu_usage() {

    echo -e "${YELLOW}CPU Usage${NC}"
    echo "--------------------------------------"

    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

    printf "CPU Utilization : %.2f%%\n" "$CPU"

    echo
}
memory_usage() {

    echo -e "${YELLOW}Memory Usage${NC}"
    echo "--------------------------------------"

    free -h

    echo
}
disk_usage() {

    echo -e "${YELLOW}Disk Usage${NC}"
    echo "--------------------------------------"

    df -h /

    echo
}
top_processes() {

    echo -e "${YELLOW}Top 5 Memory Consuming Processes${NC}"
    echo "--------------------------------------"

        ps -eo pid,user,comm,%mem,%cpu --sort=-%mem | head -6

    echo
}
service_status() {

    echo -e "${YELLOW}Service Status${NC}"
    echo "--------------------------------------"

    SERVICES=("ssh" "docker" "cron")

    for service in "${SERVICES[@]}"
    do
        if systemctl list-unit-files | grep -q "^${service}.service"; then

            if systemctl is-active --quiet "$service"; then
                echo -e "$service : ${GREEN}Running${NC}"
            else
                echo -e "$service : ${RED}Stopped${NC}"
            fi

        else
            echo "$service : Not Installed"
        fi
    done

    echo
}
network_check() {

    echo -e "${YELLOW}Network Connectivity${NC}"
    echo "--------------------------------------"

    if ping -c 2 8.8.8.8 > /dev/null 2>&1
    then
        echo -e "${GREEN}Internet Connection : OK${NC}"
    else
        echo -e "${RED}Internet Connection : FAILED${NC}"
    fi

    echo
}
overall_health() {

    echo -e "${YELLOW}Overall Health${NC}"
    echo "--------------------------------------"

    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

    CPU_INT=$(printf "%.0f" "$CPU")

    if [ "$CPU_INT" -lt 70 ]; then
        echo -e "${GREEN}System Status : HEALTHY${NC}"
    else
        echo -e "${RED}System Status : HIGH CPU USAGE${NC}"
    fi

    echo
}

main() {
    print_header
    system_info
    cpu_usage
    memory_usage
    disk_usage
    top_processes
    service_status
    network_check
    overall_health
}

main