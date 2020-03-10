
#attempted do use nix pill 20 to build, so that useHaskellFFIWithCMake can see the message.h file, but still nfg
let
  nixpkgs = import <nixpkgs> {};
  
  inherit (nixpkgs) stdenv cmake which;
  
  supply =  stdenv.mkDerivation {
    name = "supplyHaskellFFIWithNixsCMake-0.0.5";
  
    src = ../supplyHaskellFFIWithNixsCMake;
    nativeBuildInputs = [ cmake ];

    installPhase = ''
  
    mkdir -p $out/bin;
    cp supplyHaskellFFIWithCMake $out/bin/;

    mkdir -p $out/lib
    install -D libmessage.so $out/lib/
    #install -D message.h $out/lib/
    #install -D Message.h $out/lib/Message.h
    #mkdir -p $out/lib
    #mkdir $out/include
    #mkdir $out/include
    #install -D libmessage.so $out/include/libmessage.so
    #install -D src/message.h $out/include/Message.h
    #cp libmessage.so $out/include
    #cp libmessage.so include
    #cp -r $src/include/* $out/include
  '';
  };
  
  use = stdenv.mkDerivation rec {
    name = "useHaskellFFIWithCMake-0.0.2";
    src = ./.  ;
    baseInputs  = [ supply ];
    nativeBuildInputs = [ cmake which];
    buildInputs = [ supply ];
    
    
    installPhase = ''
      mkdir -p $out/bin;
      cp useMessage $out/bin/;
      echo "exec $(which supplyHaskellFFIWithNixsCMake)"
      #echo "exec $(which supply)" 
      echo "jhw: end of install phase"
      #echo "#! ${stdenv.shell}" >> "$out/bin/supplyHaskellFFIWithNixsCMake"
    '';
  };
in use