{
  stdenv,
  writeShellScriptBin,
  python,
  asciimatics,
}:

let
  mkBinary =
    outPath:
    writeShellScriptBin "run_flame_show" ''
      ${python}/bin/python ${outPath}/src/ashow/flame.py
    '';
in
stdenv.mkDerivation (finalAttrs: {
  name = "ashow";
  src = ./.;

  propagatedBuildInputs = [ asciimatics ];

  installPhase = ''
    mkdir -p $out/lib/python${python.pythonVersion}/site-packages
    cp -r $src/src/* $out/lib/python${python.pythonVersion}/site-packages

    mkdir $out/bin
    cp ${mkBinary finalAttrs.src}/bin/run_flame_show $out/bin/run_flame_show
  '';
})
