{ config, lib, pkgs, ...}:
{
  imports = [
    ../../common/storage.nix
    ../../common/netboot.nix
  ];

  vpsadmin.netInterfaces = [ "oneg0" "oneg1" ];
  vpsadmin.consoleHost = "172.16.0.6";

  boot.kernelModules = [ "8021q" ];

  services.nfs.server.nfsd = {
    nproc = 16;
    udp = true;
  };
  services.zfs.autoScrub.interval = "0 4 1 */2 *";

  boot.zfs.pools.storage = {
    guid = "2575935829831167981";
  };
}
