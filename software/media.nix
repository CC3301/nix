{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    libsForQt5.kdenlive
    mediainfo
    glaxnimate
    ffmpeg
  ];
}
