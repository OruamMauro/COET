#!/bin/bash

# Function to display script usage
function show_usage() {
    echo "Usage: $0 -k|--key <ssh_key_file> -f|--file <file_name> [-a|--action <put|get>]"
    exit 1
}

# Default action is 'put'
action="put"

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -k|--key)
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
    sftp -i "$ssh_key" -P 8022 luffytarou@wano.kuni:/onigashima/ <<< "put $file_name"
elif [ "$action" == "get" ]; then
    echo "Downloading $file_name from the server..."
    sftp -i "$ssh_key" -P 8022 luffytarou@wano.kuni:/onigashima/ <<< "get $file_name /home/luffy/downloads/$file_name"
fi