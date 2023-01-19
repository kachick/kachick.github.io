{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/8eabb500ebf5dcb9a40024c1150ef348cefa8320.tar.gz") { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.deno
    pkgs.expect
    pkgs.direnv
    pkgs.dprint
    pkgs.nil
    pkgs.nixpkgs-fmt
  ];
}
