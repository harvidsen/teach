{
  pyproject-nix,
  python,
}:
let
  project = pyproject-nix.lib.project.loadPyproject {
    projectRoot = ./.;
  };
  attrs = project.renderers.buildPythonPackage { inherit python; };
  extraAttrs = {
    nativeCheckInputs = [ python.pkgs.pytestCheckHook ];
  };
in
python.pkgs.buildPythonPackage (attrs // extraAttrs)
