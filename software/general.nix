{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    google-chrome
    firefox
    plasma-browser-integration
    signal-desktop
    telegram-desktop
    htop
    iftop
    iotop
    kmail
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
