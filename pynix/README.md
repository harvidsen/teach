# How to leverage nix flakes when developing a python package

## Just building one thing
- Make a flake template: `nix flake init`
- Go read about the [Flake schema](https://wiki.nixos.org/wiki/Flakes#Flake_schema)
  - Standardized flake schema makes `nix` commands appear a bit magic
- Import `pkgs` from `nixpkgs` and add it to default devshell
  - `nix develop`
- We can run our python script with `python src/ashow/flame.py`. Or we can build and install it into our devshell. Notice we don't need to include asciimatics explicitly anymore, due to `propagatedBuildInputs`.
  - `nix build` then inspect output `ls result`
  - Run the installed package `run_flame_show`
  - Or import in python `python -c "import ashow"`

## Editable mode
- Now if we refactor our package and want to change our motivational message. It doesn't change?
