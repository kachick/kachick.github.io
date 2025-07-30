{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default =
            with pkgs;
            mkShellNoCC {
              env = {
                # Fix nixd pkgs versions in the inlay hints
                NIX_PATH = "nixpkgs=${pkgs.path}";
              };

              buildInputs = [
                bashInteractive
                direnv
                nixfmt
                nixfmt-tree
                nixd

                deno

                dprint
                typos
                stylelint
              ];
            };
        }
      );
    };
}
