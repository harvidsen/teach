{
  stdenv,
}:

stdenv.mkDerivation {
  name = "simple";
  src = ./.;
  buildPhase = ''
    mkdir -p $out
    echo "hei på deg" > $out/hei
  '';
}
