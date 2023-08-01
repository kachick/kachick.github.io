{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/d625c365634b495154feb4a67806ca569a9d8e9c";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              deno
              expect # To keep color in tee of local development
              direnv
              dprint
              nil
              nixpkgs-fmt
            ];
          };
      });
}
