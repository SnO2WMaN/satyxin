let
  lock = builtins.fromJSON (builtins.readFile ../flake.lock);
in
  {
    name,
    sources ? {},
  }: {
    pkgs,
    deps ? [],
  }:
    pkgs.satyxin.buildPackage {
      inherit name sources deps;
      src = with lock.nodes."satysfi-${name}".locked;
        pkgs.fetchFromGitHub {
          inherit owner repo rev;
          sha256 = narHash;
        };
    }
