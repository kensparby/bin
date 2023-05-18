#!/bin/bash
#
# Checks the $PATH variable for the existence of a given directory. Errors if found.
# Usage: ./check_path.sh "/usr/bin"

target_dir="$1"

IFS=':' directories=($PATH)
found=false

for dir in "${directories[@]}"; do
  if [ "$dir" = "$target_dir" ]; then
    found=true
    break
  fi
done

if [ "$found" = true ]; then
  exit 1
else 
  exit 0
fi
