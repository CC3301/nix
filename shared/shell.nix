{ config, pkgs, lib, ... }:
{
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "docker" "ssh-agent"];
    theme = "robbyrussell";
  };
}
