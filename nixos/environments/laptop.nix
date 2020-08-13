# laptop role is used on all portable laptop machines

{ config, lib, ... }:

with lib;

{
  config = {
    # enable suspend
    powerManagement.enable = mkDefault true;

    # for power optimizations
    powerManagement.powertop.enable = true;

    #services.low-battery-check = {
      #enable = true;
      #action = "hibernate";
    #};

    # enable TLP daemon for power saving
    services.tlp.enable = true;

    # enable upower service for battery
    services.upower = {
      enable = true;
      criticalPowerAction = "Hibernate";
    };

    # Do not turn off when closing laptop lid
    services.logind.extraConfig = ''
      HandleLidSwitch=ignore
    '';

    # keep timezone updated to local time using geoclue
    time.timeZone = null;
    services.localtime.enable = true;

    # enable captive-browser, so we can connect to network that are secured
    # by captive portal
    programs.captive-browser.enable = true;
  };
}
