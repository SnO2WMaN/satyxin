let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {pkgs, ...}:
    pkgs.stdenv.mkDerivation {
      name = "dist";
      src = [
        (with lock.nodes."satysfi".locked;
          pkgs.fetchFromGitHub {
            inherit owner repo rev;
            sha256 = narHash;
            name = "satysfi";
          })
        (pkgs.fetchzip {
          name = "lm2004otf";
          url = http://www.gust.org.pl/projects/e-foundry/latin-modern/download/lm2.004otf.zip;
          sha256 = "sha256-V6hnlkcjeFeH7gOdH5pRvmqT9rsAnLxFnFw0B5dDiNU=";
          stripRoot = false;
        })
        (pkgs.fetchzip {
          name = "latinmodernmath1959";
          url = http://www.gust.org.pl/projects/e-foundry/lm-math/download/latinmodern-math-1959.zip;
          sha256 = "sha256-et/WMhfZZYgP0S7ZmI6MZK5owv9bSoMBXFX6yGSng5Y=";
        })
        (pkgs.fetchzip {
          name = "junicode";
          url = http://downloads.sourceforge.net/project/junicode/junicode/junicode-1.002/junicode-1.002.zip;
          sha256 = "sha256-1q+fNdPjUJyuO6obWfstfCN9cuM/0mcB3LF9LVifBtk=";
          stripRoot = false;
        })
        (pkgs.fetchzip {
          name = "ipaex";
          url = https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00401.zip;
          sha256 = "sha256-/87qJIb+v4qrtDy+ApfXxh59reOk+6RhGqFN98mc+8Q=";
        })
      ];
      unpackPhase = ''
        for srcFile in $src; do
          cp -r $srcFile $(echo $srcFile | cut --delimiter=- --fields=2-)
        done
      '';

      phases = ["installPhase"];
      installPhase = ''
        distsatysfi=$(echo $src | tr ' ' '\n' | grep -E ".*-satysfi")/lib-satysfi/dist
        mkdir -p $out/lib/satysfi/dist/{fonts,hash,hyph,,packages,unidata}

        cp -r $distsatysfi/hash/* $out/lib/satysfi/dist/hash
        cp -r $distsatysfi/hyph/* $out/lib/satysfi/dist/hyph
        cp -r $distsatysfi/packages/* $out/lib/satysfi/dist/packages
        cp -r $distsatysfi/unidata/* $out/lib/satysfi/dist/unidata

        for file in $(find $(echo $src | tr ' ' '\n' | grep -E ".*-lm2004otf") -name "*.otf"); do
            cp $file $out/lib/satysfi/dist/fonts
        done
        for file in $(find $(echo $src | tr ' ' '\n' | grep -E ".*-latinmodernmath1959")/otf -name "*.otf"); do
            cp $file $out/lib/satysfi/dist/fonts
        done
        for file in $(find $(echo $src | tr ' ' '\n' | grep -E ".*-junicode") -name "*.ttf"); do
            cp $file $out/lib/satysfi/dist/fonts
        done
        for file in $(find $(echo $src | tr ' ' '\n' | grep -E ".*-ipaex") -name "*.ttf"); do
            cp $file $out/lib/satysfi/dist/fonts
        done
      '';
      setupHook = pkgs.writeText "setuphook-satysfi-package" ''
        SATYSFI_LIBPATH+=:$1/lib/satysfi
      '';
    }
