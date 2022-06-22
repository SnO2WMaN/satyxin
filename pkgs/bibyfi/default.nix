let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {pkgs}:
    pkgs.satyxin.buildPackage {
      name = "bibyfi";
      src = with lock.nodes.satysfi-bibyfi.locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      path = "./bibyfi.satyh";
    }
