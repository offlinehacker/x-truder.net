{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.roles.dev.ops;
in {
  options.roles.dev.ops.enable = mkEnableOption "OPS development";

  config = mkIf cfg.enable {
    profiles.vbox.enable = mkDefault true;

    profiles.xonsh.pythonPackages = with pkgs.python3Packages; [
      kubernetes
    ];

    environment.systemPackages = with pkgs; [
      packer
      vagrant
      kubernetes
      kubernetes-helm
      awscli
      ec2_ami_tools
      ec2_api_tools
      google-cloud-sdk
      terraform
      kops
      kops.out
      azure-cli
      nixops
      ansible
      telepresence
      remarshal
      proot
      cfssl
      confluent
      kail
      skopeo
      kind.bin
      minikube.bin

      (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          name = "terraform";
          publisher = "mauve";
          version = "1.2.0";
          sha256 = "04jk9ydzz8rwv8y3bphl2v5h9a73qjgs2bs22m0glh4wsq8d7h55";
        };
      })
    ];
  };
}
