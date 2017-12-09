{ stdenv, pkgs }:

stdenv.mkDerivation rec {
  name = "arduino-dev-${version}";
  src = ./.;
  version = "0.1.0";

  ARDUINO_PATH="${pkgs.arduino-core}";

  buildInputs = with pkgs; [
    avrbinutils
    avrdude
    avrgcc
    avrlibc
    arduino-core
  ];

  shellHook = ''
    export PATH="$PATH:${pkgs.arduino-core}/share/arduino/"
  '';
}
