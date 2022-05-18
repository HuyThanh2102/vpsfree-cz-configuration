{ config, pkgs, ... }:
let

  modemNetBringUp = pkgs.writers.writeBashBin "modem-network-bring-up" ''
    ip link set down wwp0s19u1u3i4
    echo Y > /sys/class/net/wwp0s19u1u3i4/qmi/raw_ip
    ip link set up wwp0s19u1u3i4
    qmicli --device=/dev/cdc-wdm0 --device-open-proxy --wds-start-network="ip-type=4,apn=gprsa.public" --client-no-release-cid
    udhcpc -q -f -n -i wwp0s19u1u3i4
    echo "nameserver 8.8.8.8" >> /etc/resolv.conf
  '';

in
{
  imports = [
    ./hardware.nix
    ../../../../../environments/base.nix
  ];

  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
      extraConfig = "serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1; terminal_input serial; terminal_output serial";
    };

    kernelParams = [ "console=ttyS0,115200n8" ];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="tty", ATTRS{idVendor}=="2c7c", ATTRS{idProduct}=="0125", ENV{ID_USB_INTERFACE_NUM}=="01", SYMLINK+="ttyUSB-EC25-nmea"
    SUBSYSTEM=="tty", ATTRS{idVendor}=="2c7c", ATTRS{idProduct}=="0125", ENV{ID_USB_INTERFACE_NUM}=="02", SYMLINK+="ttyUSB-EC25-at", OWNER="smsd"
    SUBSYSTEM=="tty", ATTRS{idVendor}=="2c7c", ATTRS{idProduct}=="0125", ENV{ID_USB_INTERFACE_NUM}=="03", SYMLINK+="ttyUSB-EC25-modem"
    SUBSYSTEM=="tty", ATTRS{serial}=="0001B337", OWNER="snajpa", GROUP="tty-vpsf-net", SYMLINK+="ttyUSB-prg-4-7-edg1-s4048"
    SUBSYSTEM=="tty", ATTRS{serial}=="0001C720", OWNER="snajpa", GROUP="tty-vpsf-net", SYMLINK+="ttyUSB-prg-4-7-tor1-s4048"
    SUBSYSTEM=="tty", ATTRS{serial}=="00013C0F", OWNER="snajpa", GROUP="tty-vpsf-net", SYMLINK+="ttyUSB-prg-4-7-tor2-s4048"
    SUBSYSTEM=="tty", ATTRS{serial}=="000C5978", OWNER="snajpa", GROUP="tty-vpsf-net", SYMLINK+="ttyUSB-prg-14-7-edg2-s4048"
    SUBSYSTEM=="tty", ATTRS{serial}=="000CBF24", OWNER="snajpa", GROUP="tty-vpsf-net", SYMLINK+="ttyUSB-prg-14-7-tor1-s4048"
    SUBSYSTEM=="tty", ATTRS{serial}=="000BF9F8", OWNER="snajpa", GROUP="tty-vpsf-net", SYMLINK+="ttyUSB-prg-14-7-tor2-s4048"
  '';

  users.groups."tty-vpsf-net".members = [ "snajpa" ];

  users.users = {
    snajpa = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGZx+5fCM/NBwVZItoTTs6wv57yFcfipM1Xl7SOyn0sj snajpa@snajpabook.vpsfree.cz"
      ];
    };
  };

  networking.interfaces.enp1s0.useDHCP = false;
  networking.interfaces.enp1s0.ipv4.addresses = [
    { address = "172.16.254.254"; prefixLength = 24; }
  ];
  networking.interfaces.enp1s0.ipv4.routes = [
    { address = "172.16.0.0"; prefixLength = 12; via = "172.16.254.1"; }
  ];

  systemd.services.modemNet = {
    description = "modemNet";
    enable = true;
    path = with pkgs; [ iproute2 libqmi busybox ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${modemNetBringUp}/bin/modem-network-bring-up";
    };
    wantedBy = [ "network.target" ];
    after = [ "network-pre.target" ];
  };

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
  environment.systemPackages = with pkgs; [
    modemNetBringUp
    usbutils
  ];

  services.gammu-smsd.enable = true;
  services.gammu-smsd.device.path = "/dev/ttyUSB-EC25-at";
  services.gammu-smsd.backend.service = "files";

  system.stateVersion = "21.11";
}
