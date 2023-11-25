{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    google-chrome
    thunderbird
    firefox
    plasma-browser-integration
    signal-desktop
    telegram-desktop
    htop
    iftop
    iotop
    anydesk
    keepassxc
    john
    hashcat
    hashcat-utils
    cudatoolkit
    remmina
    bitwarden
  ];
}
