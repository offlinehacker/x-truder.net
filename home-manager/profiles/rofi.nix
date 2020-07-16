{ config , pkgs, ... }:

let
  modifier = config.xsession.windowManager.i3.config.modifier;

  passCmd = "exec --no-startup-id ${pkgs.rofi-pass}/bin/rofi-pass";
  drunCmd = "exec ${pkgs.rofi}/bin/rofi -combi-modi drun -show combi -modi combi -show-icons";

in {
  programs.rofi = {
    enable = true;
    extraConfig = ''
      rofi.dpi: 0
    '';
  };

  # fix pwgen
  home.file.".config/rofi-pass/config".text = ''
    _pwgen() {
      pwgen -y "$@" 1
    }

    clip=wayland
    password_length=20
  '';

  xsession.windowManager.i3.config.keybindings = let
    modifier = config.xsession.windowManager.i3.config.modifier;
  in {
    # start passmenu
    "${modifier}+p" = passCmd;

    # start drun
    "${modifier}+d" = drunCmd;
  };

  wayland.windowManager.sway.config.keybindings = let
    modifier = config.wayland.windowManager.sway.config.modifier;
  in {
    # start passmenu
    "${modifier}+p" = passCmd;

    # start drun
    "${modifier}+d" = drunCmd;
  };

  home.packages = [ pkgs.rofi-pass pkgs.wl-clipboard ];
}
