#!/bin/sh

# refresh packages from channel and update "cache"
nixr () {
    nix-channel --update
    nix-env -qa > ~/devel/nixpkgs/pkgs
}

# nix description
nixd () {
    nix-env -qa --description "$@"
}

# nix search in cache
nixs () {
    grep -i "$1" ~/devel/nixpkgs/pkgs
}

# nix install
nixi () {
    nix-env -i "$@"
}
