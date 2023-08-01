#!/bin/bash

CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
L_MAGENTA="\e[95m"
END="\e[0m"

# Function to display script usage
function show_usage() {
    echo -e "\n${YELLOW}Usage:${END} $0 -s|--secret <secret_value>\n\n"
    echo -e "Please check the ${CYAN}/opt/adenza/08/hint${END} programm\n"
    exit 1
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -s|--secret)
            shift
            secret_value="$1"
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
if [ -z "$secret_value" ]; then
    echo -e "${RED}Error: Missing required option.${END}"
else
    # Perform the curl request
    curl -X POST -H "Content-Type: application/json" -d '{"key":"'"$secret_value"'"}' http://marineford.island:8090/shanks/red
    #curl -X POST -H "Content-Type: application/json" -d '{"key":"'"$secret_value"'"}' http://marineford.island:8090/shanks/red -o /tmp/response.json
fi
#echo "Curl request completed. Response saved in /tmp/response.json."
