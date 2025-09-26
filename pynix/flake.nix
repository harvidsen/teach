{
  description = "An example python project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };

    in
    {

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.python3.pkgs.asciimatics
        ];
      };

    };
}
