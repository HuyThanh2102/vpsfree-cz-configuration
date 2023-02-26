{ config, ... }:
let
  allAddresses = {
    primary = { address = "172.16.0.34"; prefix = 32; };
    teng0 = {
      v4 = [
        { address = "172.16.251.14"; prefix = 30; }
      ];
      v6 = [
        { address = "2a03:3b40:42:2:4::2"; prefix = 80; }
      ];
    };
    teng1 = {
      v4 = [
        { address = "172.16.250.14"; prefix = 30; }
      ];
      v6 = [
        { address = "2a03:3b40:42:3:4::2"; prefix = 80; }
      ];
    };
  };
in {
  cluster."cz.vpsfree/nodes/prg/node24" = rec {
    spin = "vpsadminos";

    swpins.channels = [ "prod-22.12" ];

    node = {
      id = 125;
      role = "hypervisor";
      storageType = "ssd";
    };

    host = {
      name = "node24";
      location = "prg";
      domain = "vpsfree.cz";
    };

    netboot = {
      enable = true;
      macs = [
        "70:b5:e8:d1:32:42"
        "70:b5:e8:d1:32:43"
      ];
    };

    addresses = with allAddresses; {
      inherit primary;
      v4 = teng0.v4 ++ teng1.v4;
      v6 = teng0.v6 ++ teng1.v6;
    };

    osNode = {
      networking = {
        interfaces = {
          names = {
            teng0 = "a0:36:9f:13:f6:6e";
            teng1 = "a0:36:9f:13:f6:6c";
          };
          addresses = {
            inherit (allAddresses) teng0 teng1;
          };
        };

        bird = {
          as = 4200001004;
          routerId = "172.16.0.34";
          bgpNeighbours = {
            v4 = [
              { address = "172.16.251.13"; as = 4200001901; }
              { address = "172.16.250.13"; as = 4200001902; }
            ];
            v6 = [
              { address = "2a03:3b40:42:2:4::1"; as = 4200001901; }
              { address = "2a03:3b40:42:3:4::1"; as = 4200001902; }
            ];
          };
        };

        virtIP = addresses.primary;
      };
    };

    services = {
      node-exporter = {};
      osctl-exporter = {};
      vpsadmin-console = {};
    };
  };
}
