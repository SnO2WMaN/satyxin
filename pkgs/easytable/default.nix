let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {
    pkgs,
    deps ? [],
  }:
    pkgs.stdenv.mkDerivation {
      name = "easytable";
      sources = builtins.toJSON {
        dirs = [
          "./src"
        ];
      };
      deps = deps;

      src = with lock.nodes."satysfi-easytable".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      installPhase = ''
        for dep in $(echo $deps | tr ' ' '\n'); do
          if [ -d $dep/lib/satysfi/dist/packages ]; then
            mkdir -p $out/lib/satysfi/dist/packages
            cp -r $dep/lib/satysfi/dist/packages/* $out/lib/satysfi/dist/packages
          fi
        done

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
      setupHook = pkgs.writeShellScript "setuphook-satysfi-package" ''
        SATYSFI_LIBPATH+=:$1/lib/satysfi
      '';
      buildInputs = with pkgs; [jq which];
    }
