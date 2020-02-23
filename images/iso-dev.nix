# This module defines development NixOS installation ISO

{config, pkgs, nix-profiles, ...}:

{
  imports = with nix-profiles.modules.nixos; [
    home-manager

    roles.iso
    roles.dev
  ];

  attributes.hasGui = true;

  users.extraUsers = {
    default = {
      name = "dev";
    };
  };

  home-manager.users.default = {config, ...}: {
    imports = with nix-profiles.modules.home-manager; [
      roles.work
      themes.materia-irblack

      dev.devops.all
      dev.android
      dev.go
      dev.node
      #dev.elm
      dev.haskell
      dev.python
      dev.ruby
      dev.nix
    ];
  };
}