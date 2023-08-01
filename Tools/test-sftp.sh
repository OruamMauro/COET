#!/bin/bash

CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
L_MAGENTA="\e[95m"
END="\e[0m"

# Function to display script usage
function show_usage() {
    echo -e "\n${YELLOW}Usage:${END} $0 -f|--file <file_name>\n\n"
    echo -e "This program helps you to validate the connectivity to the SFTP server ${CYAN}wano.kuni${END}\n"
    echo -e "Create an empty file and use it to test the connectivity.\n"
    echo -e "Note: The identity file (${CYAN}/home/luffy/.ssh/id_rsa${END}) should be with no passphrase.\n"
    exit 1
}

# Default action is 'put'
action="put"

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -f|--file)
            shift
            file_name="$1"
            ;;
        -a|--action)
            shift
            action="$1"
            if [[ "$action" != "put" && "$action" != "get" ]]; then
                echo -e "${RED}Error: Invalid action. Use 'put' for upload or 'get' for download.${END}"
                show_usage
            fi
            ;;
        -h|--help)
            shift
            show_usage
            ;;
        *)
            echo "-e ${RED}Error: Unknown option '$key'${END}"
            show_usage
            ;;
    esac
    shift
done

# Check if required options are provided
if [ -z "$file_name" ]; then
    echo -e "${RED}Error: Missing required options.${END}"
    show_usage
fi

# Upload or download the file based on the specified action
if [ "$action" == "put" ]; then
    echo "Uploading $file_name to the server..."
    sftp -oNumberOfPasswordPrompts=0 -i /home/luffy/.ssh/id_rsa -P 8022 luffytarou@wano.kuni:/onigashima/ <<< "put $file_name"
elif [ "$action" == "get" ]; then
    echo "Downloading $file_name from the server..."
    sftp -oNumberOfPasswordPrompts=0 -i /home/luffy/.ssh/id_rsa -P 8022 luffytarou@wano.kuni:/onigashima/ <<< "get $file_name /opt/adenza/07/dw/$file_name"
fi