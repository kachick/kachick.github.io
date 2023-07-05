{ pkgs ? import
    (fetchTarball
      "https://github.com/NixOS/nixpkgs/archive/d625c365634b495154feb4a67806ca569a9d8e9c.tar.gz")
    { }
}:

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
