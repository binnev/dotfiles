#!/bin/sh
set -e
pushd ~/dotfiles/nixos/
git add --all

# format .nix files
alejandra . --quiet
git diff -U0 *.nix
sudo echo "NixOS Rebuilding..."

# This does NOT update the flake.lock. It just rebuilds the system using the 
# exact stuff in flake.lock. 
sudo nixos-rebuild switch --flake .#$HOSTNAME &>~/nixos-switch.log || (
  cat ~/nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations --json | jq "map(.generation) | max")
msg="NixOS $HOSTNAME gen $gen"
git commit -am "$msg"
popd
