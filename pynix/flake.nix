{
  description = "An example python project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    pyproject-nix = {
      url = "github:pyproject-nix/pyproject.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      pyproject-nix,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      defaultPackage = self.packages.${system}.default;

    in
    {
      packages.${system} = {
        inherit (pkgs.python3.pkgs) asciimatics;
        first_build = pkgs.python3.pkgs.callPackage ./first_build.nix { };
        second_build = pkgs.python3.pkgs.callPackage ./build_python_package.nix { };
        default = pkgs.python3.pkgs.callPackage ./pyproject_build.nix { inherit pyproject-nix; };
      };

      checks.${system} = self.packages.${system};

      devShells.${system}.default = pkgs.mkShell {
        inputsFrom = [
          defaultPackage
        ];

        packages = [
          pkgs.uv
        ]
        ++ defaultPackage.passthru.dependency-groups.test;

        shellHook = ''
          root=$(git rev-parse --show-toplevel)/pynix
          export PYTHONPATH="$root/src:$PYTHONPATH"
        '';
      };

    };
}
