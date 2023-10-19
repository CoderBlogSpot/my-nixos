# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
     /etc/nixos/hardware-configuration.nix
    ];

  environment.variables = {
	SUDO_EDITOR = "nvim";      
  };

  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { src = /home/chrizelle/.config/dwm; });
    })
  ];

  nixpkgs.overlays = [
      (final: prev: { 
        slstatus = prev.slstatus.overrideAttrs (old: { src = /                  	home/chrizelle/.config/slstatus; }); 
      })
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1u"
  ];

  nixpkgs.config.allowUnfreePredicate = (pkg: builtins.elem   	(builtins.parseDrvName pkg.name).name [ "steam" ]);
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-	gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };


  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "hackerbox";
  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.displayManager = {
      lightdm.enable = true;
      autoLogin = {
	        enable = true;
          user = "chrizelle";
      };
  };

  # Configure keymap in X11
  services.xserver.layout = "us";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.picom.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.dbus.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.chrizelle = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "video" "audio" "kvm" "disk"     	"input" ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pkgs.xfce.thunar
    pkgs.vscode
    pkgs.nitrogen
    pkgs.lxappearance
    pkgs.flameshot
    pkgs.neovim
    pkgs.obsidian
    pkgs.htop
    pkgs.neofetch
    pkgs.pulseaudio
    pkgs.pulseaudio-ctl
    pkgs.pavucontrol
    pkgs.google-chrome
    pkgs.rofi
    pkgs.gnome.cheese
    pkgs.vlc
    pkgs.python3Full
    python.pkgs.pip
    pkgs.nodejs_20
    pkgs.xarchiver
    pkgs.unzip
    pkgs.polkit_gnome
    pkgs.kitty
    pkgs.gcc
    pkgs.steam
    pkgs.steam-run
    pkgs.xdg-desktop-portal-gtk
    pkgs.xorg.libX11
    pkgs.xorg.libxcb
    pkgs.xorg.libXft
    pkgs.xorg.libXinerama
    pkgs.xorg.xinit
   ];

 programs.steam = {
   enable = true;
   remotePlay.openFirewall = true; 
   dedicatedServer.openFirewall = true; 
 };
 
 services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    # wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
 
 security.polkit.enable = true;
 systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
   extraConfig = ''
     DefaultTimeoutStopSec=10s
   '';
  };

  # Auto upgrades
  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  system.stateVersion = "23.05"; # Did you read the comment?

}
