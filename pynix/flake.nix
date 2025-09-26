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
        default = pkgs.python3.pkgs.callPackage ./first_build.nix { };
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          self.packages.${system}.default
        ];
      };

    };
}
