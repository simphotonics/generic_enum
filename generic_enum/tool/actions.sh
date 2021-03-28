#!/bin/bash --

# Colour definitions:
BLUE='\033[1;34m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
RESET='\033[0m'

# Return immediately if a command returns a non-zero result.
set -e

echo
echo -e "${BLUE}=== Resolving dependencies $PWD...${RESET}"
echo
dart pub get
dart pub upgrade

echo
echo -e "${PURPLE}=== Checking Source Code Formatting${RESET} $PWD..."
echo
# Overwrite files with formatted content: -w
# Dry run: -n
dart format lib test

echo
echo -e "${YELLOW}=== Analyzing $PWD...${RESET}"
echo
dart analyze \
    --fatal-warnings \
    --fatal-infos

echo
echo -e "${GREEN}=== Testing $PWD...${RESET}"
echo
# Only run if directory test exists:
grep -q test pubspec.yaml && \
dart test
