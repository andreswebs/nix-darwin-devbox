#!/usr/bin/env bash
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sed -i '' "s/devbox/$(scutil --get LocalHostName)/g" "${SCRIPT_PATH}/../flake.nix"

# "258ba03e-dfb1-46cc-9050-0b9efd311b2f"
