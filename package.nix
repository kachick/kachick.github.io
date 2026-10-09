{
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "kachick.github.io";
  version = "0.0.0";

  src = ./public;

  installPhase = ''
    mkdir -p $out
    cp -r * $out/
  '';
}
