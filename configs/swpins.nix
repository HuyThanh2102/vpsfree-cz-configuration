{ config, ... }:
let
  nixpkgsBranch = branch: {
    type = "git-rev";

    git-rev = {
      url = "https://github.com/NixOS/nixpkgs";
      update.ref = "refs/heads/${branch}";
    };
  };

  osBranch = branch: {
    type = "git-rev";

    git-rev = {
      url = "https://github.com/vpsfreecz/vpsadminos";
      update.ref = "refs/heads/${branch}";
    };
  };

  vpsadminBranch = branch: {
    type = "git";

    git = {
      url = "https://github.com/vpsfreecz/vpsadmin";
      update.ref = "refs/heads/${branch}";
    };
  };

  nixpkgsUnstable = nixpkgsBranch "nixos-unstable";

  vpsadminosMaster = osBranch "master";

  vpsadminosProd21_03 = osBranch "prod-21.03";

  vpsadminosDevel = osBranch "devel";

  vpsadminMaster = vpsadminBranch "master";

  vpsadminDevel = vpsadminBranch "devel";
in {
  confctl.swpins.channels = {
    storage = {
      nixpkgs = nixpkgsUnstable;
      vpsadminos = vpsadminosMaster;
      vpsadmin = vpsadminMaster;
    };

    playground = {
      nixpkgs = nixpkgsUnstable;
      vpsadminos = vpsadminosMaster;
      vpsadmin = vpsadminMaster;
    };

    staging = {
      nixpkgs = nixpkgsUnstable;
      vpsadminos = vpsadminosMaster;
      vpsadmin = vpsadminMaster;
    };

    prod21_03 = {
      nixpkgs = nixpkgsUnstable;
      vpsadminos = vpsadminosProd21_03;
      vpsadmin = vpsadminMaster;
    };

    os-master = { vpsadminos = osBranch "master"; };

    os-staging = { vpsadminos = osBranch "staging"; };

    os-devel = { vpsadminos = osBranch "devel"; };

    os-runtime-deps = { vpsadminos-runtime-deps = osBranch "osctl-env-exec"; };

    nixos-unstable = { nixpkgs = nixpkgsBranch "nixos-unstable"; };

    nixos-stable = { nixpkgs = nixpkgsBranch "nixos-20.09"; };

    "nixos-19.03" = { nixpkgs = nixpkgsBranch "nixos-19.03"; };
  };
}
