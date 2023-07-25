#!/bin/bash

CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
L_MAGENTA="\e[95m"
END="\e[0m"

set -o allexport

# Function to validate if the code is alphanumeric and has 10 characters
function validate_code() {
  read -p "Enter an alphanumeric text of 10 characters: " code
  if [[ "$code" =~ ^[[:alnum:]]{10}$ ]]; then
    echo -e "The code ${CYAN}\"$code\"${END} is valid!"
    echo $code > /tmp/.USER_CODE
    source /opt/.Fe7ege5/Tools/set_vars.sh
    exit 0
  else
    echo -e "Error: The code ${RED}\"$code\"${END} is not valid. It should be alphanumeric and have 10 characters."
    validate_code
  fi
}

validate_code
