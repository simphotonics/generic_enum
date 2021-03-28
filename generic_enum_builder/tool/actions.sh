#!/bin/bash --

# Travis script for:
#   generic_enum_builder

# Defining colours
BLUE='\033[1;34m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
RESET='\033[0m'

# Exit immediately if a command exits with a non-zero status.
set -e

# Folder name
FOLDER=$(basename $PWD)

# Resolving dependencies
echo
echo -e "${BLUE}=== Resolving Dependencies $PWD...${RESET}"
echo

# Make sure .dart_tool/package_config.json exists.
dart pub get

# Upgrade packages.
dart pub upgrade

echo
echo -e "${PURPLE}=== Checking Source Code Formatting${RESET} $PWD..."
echo
dart format lib test

# Analyze dart files
echo
echo -e "${YELLOW}=== Analyzing $PWD...${RESET}"
echo

dart analyze \
    --fatal-warnings \
    --fatal-infos


# Running tests
echo
echo -e "${CYAN}=== Testing $PWD...${RESET}"
echo
dart test
