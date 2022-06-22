let
  lock = builtins.fromJSON (builtins.readFile ../flake.lock);
in
  {
    name,
    path,
  }: {pkgs}:
    pkgs.satyxin.buildPackage {
      name = "uline";
      src = with lock.nodes."satysfi-${name}".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
      path = path;
    }
