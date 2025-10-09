{
  pyproject-nix,
  python,
  cowsay,
}:
let
  project = pyproject-nix.lib.project.loadPyproject {
    projectRoot = ./.;
  };
  attrs = project.renderers.buildPythonPackage { inherit python; };
  extraAttrs = {
    dependencies = attrs.dependencies ++ [ cowsay ];
    nativeCheckInputs = [
      python.pkgs.pytestCheckHook
      cowsay
    ];
  };
in
python.pkgs.buildPythonPackage (attrs // extraAttrs)
