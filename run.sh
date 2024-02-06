#!/usr/bin/env bash
nix run nix-darwin --extra-experimental-features 'nix-command flakes' -- switch --flake ~/.config/nix-darwin
