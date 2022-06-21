{
  description = "Build SATySFi documents using Nix";

  outputs = { self, ... }:
    rec {
      overlays.default = (import ./overlay.nix);
      overlay = overlays.default;
    };
}
