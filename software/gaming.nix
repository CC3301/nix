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
    prismlauncher
    rnnoise
    rnnoise-plugin
    ckb-next
   # (pkgs.makeAutostartItem { name = "ckb-next"; package = "ckb-next"; })
  ];

  # Java
  programs.java = { 
    enable = true; 
    package = pkgs.openjdk11; 
  };
}
