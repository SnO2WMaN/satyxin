let
  lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
in
  {pkgs}:
    pkgs.satyxin.buildPackage {
      name = "satysfi-uline";
      src = with lock.nodes.satysfi-uline.locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      path = "uline.satyh";
    }
