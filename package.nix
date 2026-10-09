{
  stdenvNoCC,
  fetchurl,
}:
let
  nanoreset = fetchurl {
    url = "https://raw.githubusercontent.com/tiaanduplessis/nanoreset/94bad84b5d1044651e333a283af6db2e54648e74/nanoreset.min.css";
    hash = "sha256-3ocdiWz5snIRcCffKNOlTOBzFuYCyKgiz9/oxwjVLUY=";
  };
in
stdenvNoCC.mkDerivation {
  pname = "kachick.github.io";
  version = "0.0.0";

  src = ./public;

  passthru = {
    inherit nanoreset;
  };

  installPhase = ''
    mkdir -p $out/vendor
    cp -r * $out/
    cp ${nanoreset} $out/vendor/nanoreset.min.css
  '';
}
