{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/4c3edba85629ec304b5269e4b0ac7f26c433df23.tar.gz") { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.deno
    pkgs.expect # To keep color in tee of local development
    pkgs.direnv
    pkgs.dprint
    pkgs.nil
    pkgs.nixpkgs-fmt
  ];
}
