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

# Delete object file
rm "${filename%.asm}.o"

# Run the executable
"./${filename%.asm}"

# Delete executable file
rm "./${filename%.asm}"