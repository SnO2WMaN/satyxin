let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {
    pkgs,
    satyxinPkgs,
  }:
    pkgs.stdenv.mkDerivation {
      name = "algorithm";
      sources = builtins.toJSON {
        dirs = [
          "./src"
        ];
      };
      src = with lock.nodes."satysfi-algorithm".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      deps = with satyxinPkgs; [
        base
        fss
      ];
      installPhase = ''
        mkdir -p $out/lib/satysfi/dist/{fonts,hash,packages}
        mkdir -p $out/lib/satysfi/dist/packages/$name/

        for dep in $(echo $deps | tr ' ' '\n'); do
          [[ -d $dep/lib/satysfi/dist/fonts ]] && cp -r $dep/lib/satysfi/dist/fonts $out/lib/satysfi/dist
          [[ -d $dep/lib/satysfi/dist/hash ]] && cp -r $dep/lib/satysfi/dist/hash $out/lib/satysfi/dist

          if [ -d $dep/lib/satysfi/dist/packages ]; then
            for file in $(find $dep/lib/satysfi/dist/packages -type f); do
              target=$out/$(realpath --relative-to=$dep $file)
              if [ ! -e $target ]; then # TODO: if exists, compare
                mkdir -p $out/$(dirname $(realpath --relative-to=$dep $file))
                cp $file $target
              # elif [ $(cmp $file $target) -eq 0 ]; then
              #   echo ok
              else
                cat $target
                cmp $file $target | echo $?
              fi
            done
          fi
        done

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
