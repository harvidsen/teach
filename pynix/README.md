# How to leverage nix flakes when developing a python package

- What is nix?
  - Functional programming language
  - Package manager cli
  - [nixpkgs](https://github.com/NixOS/nixpkgs/)
  - NixOS
- What is [nix flakes](https://www.tweag.io/blog/2020-05-25-flakes/)?
  - An effort to standardize a project (git repo) and lock dependencies
  - Experimental since 2021, but widely used

> A flake refers to a file-system tree whose root directory contains the Nix file specification called flake.nix.

## Just building one thing
- Make a flake template: `nix flake init`
- Go read about the [Flake schema](https://wiki.nixos.org/wiki/Flakes#Flake_schema)
  - Standardized flake schema makes `nix` commands appear a bit magic
- See simple_build for a minimal example of what a package can be
  - `cat result/bin/run_something` to see what we have made. Notice what `${bash}` in `simple_build.nix` means.
  - `ls` store paths to go deeper
- Some low-level things about derivations we don't have to understand, but I include for completeness
  - `nix derivation show .#simple_build`
    - cat the derivation file in the store
    - notice the environment variables and other attributes
    - builder is executed in a "completely isolated temporary sandbox", with `env` set and with `args`. `inputDrvs` must be already built.
  - Inspect in `nix repl` is perhaps better.
    - distinction between `derivation` and `stdenv.mkDerivation`.
- Conclusion: A derivation defines scripts being ran with some env variables and producing and output path, while making sure dependencies already exists.


## Simple build of python package
- Import `pkgs` from `nixpkgs` and add it to default devshell
  - `nix develop`
- We can run our python script with `python src/ashow/flame.py`. Or we can build and install it into our devshell. Notice we don't need to include asciimatics explicitly anymore, due to `propagatedBuildInputs`.
  - `nix build` then inspect output `ls result`
  - Run the installed package `run_flame_show`
  - Or import in python `python -c "import ashow"`
- Take a look at the package in `nix repl`

## Editable mode
- Now if we refactor our package and want to change our motivational message. It doesn't change?
- Use shellHook to "install" package in "editable mode"

## Use a build helper like a sane person
- Init pyproject.toml with uv
- buildPythonPackage
  - How they do it in nixpkgs
- Take a look at the package in `nix repl`

## Pytest and flake checks
- Add pytest
- Use pytestCheckHook
- Include in flake checks
- We should still be able to just run pytest in the project

## pyproject-nix
- Is an new flake input
- Parses more of the pyproject.toml
- Nice for tidying up
- Take a look at the package in `nix repl`

# Other things

## [uv2nix](https://github.com/pyproject-nix/uv2nix?tab=readme-ov-file)
- Read and get dependencies form pypi via pyproject.yoml
  - More like regular uv packaging
  - No nixpkgs to tell you what version should be used

## Sales pitch for new nix people
- Non-python dependencies giving you a hard time?
  - Add them to you package too
- Really show it by disabling the devshell

## [devenv](https://devenv.sh/)
- A really simple way of using nix for defining develop environments
