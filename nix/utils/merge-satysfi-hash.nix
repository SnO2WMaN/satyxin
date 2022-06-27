{pkgs}:
with pkgs; (
  writers.writePerlBin "merge-satysfi-hash"
  {libraries = with perlPackages; [ListMoreUtils];}
  (builtins.readFile ./merge-satysfi-hash.pl)
)
