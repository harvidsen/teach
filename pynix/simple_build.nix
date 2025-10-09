{
  stdenv,
}:

stdenv.mkDerivation {
  name = "simple";
  src = ./.;
  buildPhase = ''
    mkdir -p $out
    echo "Hei på deg" > $out/hei
  '';
}
