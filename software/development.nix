{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-python.python
        ms-azuretools.vscode-docker
        hashicorp.terraform
        golang.go
      ];
    })
    python310
    python310Packages.dnspython    
    terraform_1
    ansible
    go
    gox
    postman
    wineWowPackages.stable
    dig
    kubectl
    git
  ];
}
