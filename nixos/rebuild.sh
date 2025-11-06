#!/bin/sh
set -e
pushd ~/dotfiles/nixos/
git add --all

# format .nix files
alejandra . --quiet
git diff -U0 *.nix

# This updates flake.lock with newer values for nixpkgs etc
read -p "Update flake.lock [y/n]? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Updating flake.lock..."
    sudo nix flake update
fi


# This does NOT update the flake.lock. It just rebuilds the system using the 
# exact stuff in flake.lock. 
echo "Rebuilding..."
sudo nixos-rebuild switch --flake .#$HOSTNAME 2>&1 | tee ~/nixos-switch.log || (
  grep --color error ~/nixos-switch.log && false
)
gen=$(nixos-rebuild list-generations --json | jq "map(.generation) | max")
msg="NixOS $HOSTNAME gen $gen"
git commit -am "$msg"
popd
