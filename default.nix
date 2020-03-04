with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "useHaskellFFIWithCMake-0.0.1";
  src = ./.  ;

  nativeBuildInputs = [ cmake ];
  buildInputs = [ supplyHaskellFFIWithCMake ];
  

  installPhase = ''
    mkdir -p $out/bin;
    cp useMessage $out/bin/;
    
  '';
}