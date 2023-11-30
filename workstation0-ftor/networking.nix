{ config, pkgs, lib, ... }:

{
  networking = {
    hostName = "workstation0-ftor";
    domain = "internal.kfnet.it";
    search = ["internal.kfnet.it"];
    nameservers = [ "192.168.188.100" ];
    networkmanager.enable = true;
    firewall.enable = false;
  };
}
