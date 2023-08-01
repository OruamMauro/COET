#!/bin/bash

CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
L_MAGENTA="\e[95m"
END="\e[0m"

# Function to display script usage
function show_usage() {
    echo -e "\n${YELLOW}Usage:${END} $0 -f|--file <file_name>\n"
    exit 1
}

# Parse command-line options
while [[ $# -gt 0 ]]; do

    case $key in
        -f|--file)
            shift
            file_name="$1"
            ;;
        -h|--help)
            shift
            show_usage
            ;;
        *)
            echo -e "${RED}Error: Unknown option '$key'${END}"
            ;;
    esac
    shift
done

# Check if required options are provided
if [ -z "$file_name" ]; then
    echo -e "${RED}Error: Missing required option.${END}"
    show_usage
fi

while [ ! -f "$file_name" ]; do sleep 1; echo -en "${L_MAGENTA}...${END}"; done