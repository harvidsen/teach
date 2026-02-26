{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

    in
    {
      packages.x86_64-linux = {
        simple = pkgs.callPackage ./simple.nix { };
        first = pkgs.python3.pkgs.callPackage ./first.nix { };
        default = pkgs.python3.pkgs.callPackage ./second.nix { };
      };

      checks.${system} = self.packages.x86_64-linux;

      devShells.${system}.default = pkgs.mkShell {
        inputsFrom = [
          self.packages.x86_64-linux.default
        ];

        packages = [
          pkgs.python3.pkgs.asciimatics
          pkgs.python3.pkgs.pytest
        ];

        shellHook = ''
          echo ShellHook
          export PYTHONPATH="$PWD/src:$PYTHONPATH"
        '';
      };

    };
}
