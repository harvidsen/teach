# How to leverage nix flakes when developing a python package

- Make a flake template: `nix flake init`
- Go read about the [Flake schema](https://wiki.nixos.org/wiki/Flakes#Flake_schema)
  - Standardized flake schema makes `nix` commands appear a bit magic
- Import `pkgs` from `nixpkgs` and add it to default devshell
  - `nix develop`
