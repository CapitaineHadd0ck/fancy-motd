#!/usr/bin/env bash

# Colors
export CA="\e[34m"  # Accent
export CO="\e[32m"  # Ok
export CW="\e[33m"  # Warning
export CE="\e[31m"  # Error
export CN="\e[0m"   # None

# Max width used for components in second column
export WIDTH=50

# Don't change! We want predictable outputs
export LANG="en_US.UTF-8"

# Dir of this script
export BASE_DIR="$(dirname $(readlink -f "$0"))"

# Run the modules and collect output
output=""
modules="$(ls -1 "$BASE_DIR/modules")"
while read module; do
    output+="$($BASE_DIR/modules/$module)\n"
done <<< $modules

# Align output in columns and print
echo -e "$output" | column -s $'\t' -t
