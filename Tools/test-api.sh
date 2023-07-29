#!/bin/bash

# Function to display script usage
function show_usage() {
    echo -e "\nUsage: $0 -s|--secret <secret_value>\n\n"
    echo -e "Note: You will need to use the script hint.sh to know what is the secret value.\n"
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
            echo "Error: Unknown option '$key'"
            show_usage
            ;;
    esac
    shift
done

# Check if required options are provided
if [ -z "$secret_value" ]; then
    echo "Error: Missing required option."
    show_usage
fi

# Perform the curl request
curl -X POST -H "Content-Type: application/json" -d '{"key":"'"$secret_value"'"}' http://marineford.island:5000/shanks/red -o /tmp/response.json

echo "Curl request completed. Response saved in /tmp/response.json."
