#!/bin/bash --

# Return immediately if a command returns a non-zero result.
set -e

# Folders to be processed
folders="generic_enum_builder \
    generic_enum_example      \
    generic_enum"

library_folder=$PWD

for folder in $folders; do
  cd "$library_folder/$folder"
  echo $(pwd)
  # Check if local script exist before executing it.
  if [ -f tool/actions.sh ]; then
    ./tool/actions.sh
  fi
done
