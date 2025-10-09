{
  buildPythonPackage,
  asciimatics,
  hatchling,
  pytestCheckHook,
}:

buildPythonPackage {
  pname = "ashow";
  version = "0.1.0";
  src = ./.;
  pyproject = true;

  build-system = [ hatchling ];

  propagatedBuildInputs = [ asciimatics ];

  nativeCheckInputs = [ pytestCheckHook ];
}
