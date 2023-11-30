{ config, pkgs, lib, ... }:

{
  networking = {
    hostName = "thinkpade585";
    domain = "internal.kfnet.it";
    search = ["internal.kfnet.it"];
    nameservers = [ "192.168.188.100" ];
    networkmanager.enable = true;
    firewall.enable = false;
  };
}
