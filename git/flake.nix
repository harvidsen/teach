{
  description = "Environment for git tutorialis";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };

    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # slides
          # graph-easy
          presenterm
          mermaid-cli
        ];
      };
    };
}
