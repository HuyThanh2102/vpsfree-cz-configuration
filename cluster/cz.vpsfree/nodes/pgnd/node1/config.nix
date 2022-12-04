{ config, lib, ... }:
{
  imports = [
    ../common.nix
    ../../common/tunables-256g.nix
  ];

  boot.zfs.pools = {
    tank = {
      install = true;
      wipe = [ "sda" "sdb" "sdc" "sdd" "sde" "sdf" "sdg" "sdh" ];
      layout = [
        { type = "mirror"; devices = [ "sdc" "sdd" ]; }
        { type = "mirror"; devices = [ "sde" "sdf" ]; }
        { type = "mirror"; devices = [ "sdg" "sdh" ]; }
      ];
      log = [
        { mirror = true; devices = [ "sda1" "sdb1" ]; }
      ];
      partition = {
        sda = {
          p1 = { sizeGB=10; };
          p2 = {};
        };
        sdb = {
          p1 = { sizeGB=10; };
          p2 = {};
        };
      };
      properties = {
        ashift = "12";
      };
    };
  };

  swapDevices = [
    { label = "swap1"; }
    { label = "swap2"; }
  ];
}
