# if release is not set, import packages from subdirectories if they exist
{ release ? false
, srcs ? import ./srcs.nix release
}:

rec {
  rmPkgs = import ./rM { inherit srcs hostPkgs; };
  hostPkgs = import ./host { inherit srcs rmPkgs; };
}
