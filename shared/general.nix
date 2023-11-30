{ config, pkgs, lib, ... }:

{
  # Java
  programs.java = { 
    enable = true; 
    package = pkgs.openjdk17; 
  };
  
  # OhMyZSH
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "docker" "ssh-agent"];
    theme = "robbyrussell";
  };

  # Virtualization stuff
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager docker-compose ];

  # Packages
  environment.systemPackages = with pkgs; [
    vim
    git
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
    appimage-run
    barrier # cross system mouse and keyboard sharing
    vlc
    libsForQt5.kdenlive
    mediainfo
    glaxnimate
    ffmpeg
    ardour
  ];
}
