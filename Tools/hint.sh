#!/bin/bash

CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
L_MAGENTA="\e[95m"
END="\e[0m"

# Function to display script usage
function show_usage() {
    echo -e "\n${YELLOW}Usage:${END} $0 -h|--help <secret_value>\n\n"
    echo -e "Hello, get the md5 checksum of this file ${CYAN}$0${END} and use it as the secret value of the test-api program.\n"
    exit 1
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
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