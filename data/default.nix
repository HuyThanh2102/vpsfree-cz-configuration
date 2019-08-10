{ config, lib, ... }@args:
{
  config = {
    _module.args = {
      data = {
        networks = import ./networks { inherit lib; };

        sshKeys = import ./ssh-keys.nix;
      };
    };
  };
}
