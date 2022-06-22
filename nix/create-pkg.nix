let
  lock = builtins.fromJSON (builtins.readFile ../flake.lock);
in
  {
    name,
    sources ? {},
  }: {pkgs}:
    pkgs.stdenv.mkDerivation {
      name = name;
      src = with lock.nodes."satysfi-${name}".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      sources = builtins.toJSON sources;
      installPhase = ''
        mkdir -p $out/lib/satysfi/dist/packages/$name/

        for i in $(seq 0 $(($(echo $sources | jq ".files | length") - 1))); do
            path=`echo $sources | jq -r ".files[$i]"`
            cp $src/$path $out/lib/satysfi/dist/packages/$name/$path
        done

        for i in $(seq 0 $(($(echo $sources | jq ".dirs | length") - 1))); do
            path=`echo $sources | jq -r ".dirs[$i]"`
            cp -r $src/$path/* $out/lib/satysfi/dist/packages/$name
        done
      '';
      setupHook = pkgs.writeText "setuphook-satysfi-package" ''
        SATYSFI_LIBPATH+=:$1/lib/satysfi
      '';
      buildInputs = with pkgs; [jq];
    }
