# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include Different Files
      ./networking.nix
      ./gaming.nix
      ../hardware/hardware-configuration.nix
      ../shared/users.nix
      ../shared/general.nix
      ../shared/development.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "nodev";
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "nvidia-x11"
    "nvidia-settings"
    "google-chrome"
    "vscode"
    "vscode-with-extensions"
    "steam"
    "steam-original"
    "steam-runtime"
    "steam-run"      
    "discord"
    "teamspeak-client"
    "anydesk"
    "cudatoolkit"
    "postman"
  ];

  # XServer Settings
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.layout = "eu";


  # Timezone and Locale settings
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LANGUAGE = "en_US.UTF-8";
  };
  time.timeZone = "Europe/Berlin";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];

  # Enable sound.
  #sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.X11Forwarding = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  # FreeIPA Integration
  security.pki.certificates = [
    ''
      INTERNAL.KFNET.IT
      ========
      -----BEGIN CERTIFICATE-----
      MIIEnTCCAwWgAwIBAgIBATANBgkqhkiG9w0BAQsFADA8MRowGAYDVQQKDBFJTlRF
      Uk5BTC5LRk5FVC5JVDEeMBwGA1UEAwwVQ2VydGlmaWNhdGUgQXV0aG9yaXR5MB4X
      DTIyMTAxMzE2NDkxNVoXDTQyMTAxMzE2NDkxNVowPDEaMBgGA1UECgwRSU5URVJO
      QUwuS0ZORVQuSVQxHjAcBgNVBAMMFUNlcnRpZmljYXRlIEF1dGhvcml0eTCCAaIw
      DQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBANB398rNMLHXD8h6bpLk0lu5V4zt
      wVjrnyi+ggaCarp/u4rYinFFj6IoZYM7GB8G4XWYtng7LSfJB28Vl0yKv1QGbupQ
      Jq92z1QYbZxJUiyzFySawaB2gg09TlYnEQOPNw37Dp59mufj8uhfG6OgYWR5d+4j
      2l1WXJT3xFbVboYPtRUuhR6SBIo8jNSsoE35RdqUmGwqslpwhR4lf8Se0QhoYw9n
      M2Al6j47DYnFlHTV4vUXNg1TWHt6eRAmcmGBxN2iMynDPg2a07LSAHE4g3VwMiMS
      83cArNljsAG4Uu4z8ZB2BhkwjfkzgOCewWczIqnHB6O+M78WFyrhKBMKjoYMu5CX
      1aUAwhN18vE6R+dZ+qq3ZyzY6K9kfl38AmRpd/Z6NEkrgymD1w/EUTsWQTN0G6Cu
      e/NgUHb1BwbDh1DzYLFcMwPR5sZaSyZ7G7di/NM+53Q2wy7Fphb8eQP5TxC2R2Fj
      tc30x/0MISZxsrjpU2WFJjZkPSSZzK0Dg9EcwwIDAQABo4GpMIGmMB8GA1UdIwQY
      MBaAFJA4EAfnT7rLuMSRZV2Jt8YgSFFYMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0P
      AQH/BAQDAgHGMB0GA1UdDgQWBBSQOBAH50+6y7jEkWVdibfGIEhRWDBDBggrBgEF
      BQcBAQQ3MDUwMwYIKwYBBQUHMAGGJ2h0dHA6Ly9pcGEtY2EuaW50ZXJuYWwua2Zu
      ZXQuaXQvY2Evb2NzcDANBgkqhkiG9w0BAQsFAAOCAYEAv2wXP+61jXSv8BJDgmMe
      AvOH0FG6HdU7sw23LYy9LWn8j9IA33zWG01t8NqTC4DISNASO0WZSxHHKRwi1o1k
      ud1MGK17JdQMjpNL/xR4XV89R5FfQWIU78P6Ly/lNTyj32sRjtJPTRjoFu/fPQHC
      I3RjnKINPnatcnmg9+SREWztny+gcxLcyTaFOjKtvaTz26hLlxwcsKxnwaqBUFTz
      yLZzBSxccyeLqdteKn5e8DBmShaCN/dV5CicX9ahVG9Who9a0n38zVxomjZ74eOw
      AcKHb10QNf1dUNBEOGbgZLU746hS41o+9DBdEdYVm1w3/7ta+uFWcJPZwd4+zHYG
      U3EzhCKgBav/0arKzxvq0bCdVEdoEwBEnKUpMMfjwd900ily3e7v5LL2u56JcKWo
      w5fMMLnKiGcKgri11/FBZkZtByKx273f7k1RQlAK2X29cFxZmll7uT7ahNvRcL7l
      6LwvvGwxLoh1gCLb4/S/a6V4ejPX6VH1YLZzHiY3wUcm
      -----END CERTIFICATE-----
    ''
  ];
}

