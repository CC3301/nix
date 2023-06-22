{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    google-chrome
    firefox
    plasma-browser-integration
    git
  ];
}