let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {pkgs}:
    pkgs.satyxin.buildPackage {
      name = "fonts-junicode";
      sources = {
      };
      src = with lock.nodes."satysfi-fonts-junicode".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
    }
