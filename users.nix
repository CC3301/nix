{ config, pkgs, lib, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ffink = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    initialPassword = "password"; # Change After Install
    shell = pkgs.zsh;
  };
}