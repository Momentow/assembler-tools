#!/bin/bash

# Check if a task number parameter is provided
if [ -z "$1" ]; then
    echo "It is automatic assembly runner!"
    echo "   Usage: ./run.sh <task_number>"
    exit 1
fi

# Construct the filename
filename="task$1.asm"

# Assemble the code
nasm -f elf64 "$filename" -o "${filename%.asm}.o"

# Link the object file
cc -o "${filename%.asm}" "${filename%.asm}.o" -no-pie

# Run the executable
"./${filename%.asm}"
