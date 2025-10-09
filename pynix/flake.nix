{
  description = "An example python project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };

    in
    {

      packages.${system} = {
        inherit (pkgs.python3.pkgs) asciimatics;
        first_build = pkgs.python3.pkgs.callPackage ./first_build.nix { };
        default = pkgs.python3.pkgs.callPackage ./build_python_package.nix { };
      };

      devShells.${system}.default = pkgs.mkShell {
        inputsFrom = [
          self.packages.${system}.default
        ];

        packages = [
          pkgs.uv
          pkgs.python3.pkgs.pytest
        ];

        shellHook = ''
          root=$(git rev-parse --show-toplevel)/pynix
          export PYTHONPATH="$root/src:$PYTHONPATH"
        '';
      };

    };
}
