{
  inputs = {
    # Can find from https://releases.nixos.org/?prefix=nixpkgs/
    nixpkgs.url = "https://releases.nixos.org/nixpkgs/nixpkgs-23.11pre509459.96d403ee2479/nixexprs.tar.xz";
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
              # expect # Enable if needed to keep color in tee of local development
              direnv
              dprint
              nil
              nixpkgs-fmt
            ];
          };
      });
}
