{ config, pkgs, lib, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ffink = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    initialPassword = "password"; # Change After Install
    shell = pkgs.zsh;
  };
  security.ipa = {
    enable = true;
    realm = "INTERNAL.KFNET.IT";
    server = "freeipa1-fkch.internal.kfnet.it";
    cacheCredentials = true;
    domain = "internal.kfnet.it";
    basedn = "dc=internal,dc=kfnet,dc=it";
    certificate = pkgs.fetchurl {
      url = https://freeipa1-fkch.internal.kfnet.it/ipa/config/ca.crt;
      sha256 = "1rl2q9w7kmcdqrl2bzcairiwzgkhwgjrldasyy0lx18ngz51n81y";
    };
  };
}
