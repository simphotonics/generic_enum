#!/bin/bash --

# Actions script for:
# generic_enum_example

# Colour definitions:
BLUE='\033[1;34m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
RESET='\033[0m'

# Return immediately if a command return non-zero result.
set -e

echo
echo -e "${BLUE}=== Resolving dependencies $PWD...${RESET}"
echo
dart pub get
dart pub upgrade

echo
echo -e "${CYAN}=== Building $PWD...${RESET}"
echo

rm -rf .dart_tool/build/
grep -q build_runner pubspec.yaml && \
    dart run build_runner build      \
        --delete-conflicting-outputs \
        --fail-on-severe             \
        --verbose
echo
echo -e "${PURPLE}=== Checking Source Code Formatting${RESET} $PWD..."
echo
dart format lib

echo
echo -e "${YELLOW}=== Analyzing $PWD...${RESET}"
echo
dart analyze \
    --fatal-warnings \
    --fatal-infos

# No test to be run.

echo
echo -e "${GREEN}=== Sync Generated Source Code${RESET} $PWD..."
echo
cp lib/*.dart ../generic_enum/test/src