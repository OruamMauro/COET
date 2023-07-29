#!/bin/bash

# Function to display script usage
function show_usage() {
    echo -e "\nUsage: $0 -i|--identity_file <ssh_key_file> -f|--file <file_name> [-a|--action <put|get>]\n\n"
    echo -e "This program helps you to validate the connectivity to the SFTP server wano.kuni\n"
    echo -e "Create an empty file and use it to test the connectivity.\n"
    echo -e "Note: The identity file you will use should be with no passphrase.\n"
    exit 1
}

# Default action is 'put'
action="put"

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -i|--identity_file)
            shift
            ssh_key="$1"
            ;;
        -f|--file)
            shift
            file_name="$1"
            ;;
        -a|--action)
            shift
            action="$1"
            if [[ "$action" != "put" && "$action" != "get" ]]; then
                echo "Error: Invalid action. Use 'put' for upload or 'get' for download."
                show_usage
            fi
            ;;
        -h|--help)
            shift
            show_usage
            ;;
        *)
            echo "Error: Unknown option '$key'"
            show_usage
            ;;
    esac
    shift
done

# Check if required options are provided
if [ -z "$ssh_key" ] || [ -z "$file_name" ]; then
    echo "Error: Missing required options."
    show_usage
fi

# Check if the file exists
if [ ! -f "$ssh_key" ]; then
    echo "Error: SSH key file not found."
    exit 1
fi

# Upload or download the file based on the specified action
if [ "$action" == "put" ]; then
    echo "Uploading $file_name to the server..."
    sftp -oNumberOfPasswordPrompts=0 -i "$ssh_key" -P 8022 luffytarou@wano.kuni:/onigashima/ <<< "put $file_name"
elif [ "$action" == "get" ]; then
    echo "Downloading $file_name from the server..."
    sftp -oNumberOfPasswordPrompts=0 -i "$ssh_key" -P 8022 luffytarou@wano.kuni:/onigashima/ <<< "get $file_name /opt/adenza/07/dw/$file_name"
fi