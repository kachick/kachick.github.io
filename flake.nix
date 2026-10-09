{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
  };

  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          nanoreset = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/tiaanduplessis/nanoreset/94bad84b5d1044651e333a283af6db2e54648e74/nanoreset.min.css";
            hash = "sha256-3ocdiWz5snIRcCffKNOlTOBzFuYCyKgiz9/oxwjVLUY=";
          };
        in
        {
          inherit nanoreset;
          default = pkgs.runCommand "kachick.github.io" { } ''
            mkdir -p $out/vendor
            cp -r ${./public}/* $out/
            cp ${nanoreset} $out/vendor/nanoreset.min.css
          '';
        }
      );
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          nanoreset = self.packages.${system}.nanoreset;
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

                caddy
                go-task

                dprint
                typos
                biome
              ];

              shellHook = ''
                mkdir -p public/vendor
                ln -sf ${nanoreset} public/vendor/nanoreset.min.css
              '';
            };
        }
      );
    };
}
