{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
      ];
    })
  ];
}