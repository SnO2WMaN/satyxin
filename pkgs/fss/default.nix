let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {pkgs}:
    pkgs.satyxin.buildPackage {
      name = "fss";
      src = with lock.nodes.satysfi-fss.locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      path = "./src/fss/fss.satyh";
    }
