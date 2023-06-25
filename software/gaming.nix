{ config, pkgs, lib, ... }:
{ 
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Corsair Harware Driver
  hardware.ckb-next.enable = true;

  # Misc Stuff
  environment.systemPackages = with pkgs; [
    obs-studio
    teamspeak_client
    discord
  ];
}