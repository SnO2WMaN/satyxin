{pkgs}: {
  src,
  packages ? [],
}:
pkgs.stdenv.mkDerivation {
  inherit src;
  name = "dot-satysfi-dist";
  packages = builtins.toJSON packages;

  dontBuild = true;
  buildInputs = with pkgs; [
    jq
  ];

  installPhase = ''
    mkdir -p $out/{fonts,hash,hyph,packages,unidata}

    for i in $(seq 0 $(($(echo $packages | jq "length") - 1))); do
      package=`echo $packages | jq -r ".[$i]"`
      cp -r $package/lib/satysfi/dist/* $out
    done
  '';
}
