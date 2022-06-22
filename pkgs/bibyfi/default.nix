let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {pkgs}:
    pkgs.stdenv.mkDerivation {
      name = "bibyfi";
      src = with lock.nodes."satysfi-bibyfi".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      sources = builtins.toJSON {
        files = [
          "./bibyfi.satyh"
          "./bibyfi-IEEETran.satyh"
        ];
      };
      installPhase = ''
        mkdir -p $out/lib/satysfi/dist/packages/$name/

        for i in $(seq 0 $(($(echo $sources | jq ".files | length") - 1))); do
            path=`echo $sources | jq -r ".files[$i]"`
            cp $src/$path $out/lib/satysfi/dist/packages/$name/$path
        done
      '';
      setupHook = pkgs.writeText "setuphook-satysfi-package" ''
        SATYSFI_LIBPATH+=:$1/lib/satysfi
      '';
      buildInputs = with pkgs; [jq];
    }
