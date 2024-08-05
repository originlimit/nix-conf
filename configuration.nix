{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Clean /tmp at boot
  boot.tmp.cleanOnBoot = true;

  networking.hostName = "silence"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking and mullvad
  networking.networkmanager.enable = true;
  networking.wireguard.enable = true;
  services.mullvad-vpn.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Enable nix experimental features, such as flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8"; LC_NUMERIC = "en_US.UTF-8"; LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable hyprland
  programs.hyprland.enable = true;

  # Configure x11 and the WM (xmonad)
  #services.xserver.enable = true;
  #services.xserver.displayManager.startx.enable = true;  # use TTY for login
  #services.xserver.windowManager.xmonad = {
  #  enable = true;
  #  enableContribAndExtras = true;
  #};

  # Configure keymap in X11
  #services.xserver = {
  #  layout = "us";
  #  xkbOptions = "caps:escape,altwin:swap_alt_win";
  #  xkbVariant = "";
  #  libinput.enable = true;
  #};

  # Enable USB media device recognition
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  # Enable Dconf
  programs.dconf.enable = true;

  # Configure fonts
  fonts.packages = with pkgs; [
    inter
    (nerdfonts.override { fonts = ["RobotoMono" "Hasklig" "Gohu"]; })
    material-design-icons
    noto-fonts
    noto-fonts-cjk
  ];

  # Configure sound and bluetooth
  #sound.enable = true;
  #sound.mediaKeys.enable = true;
  #hardware.pulseaudio.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = false;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Configure the backlight
  programs.light.enable = true;

  # Make nvim the default editor
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # DROID
  programs.adb.enable = true;

  # Android emulation
  virtualisation.waydroid.enable = true;

  # Enable steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };

  # Daemon that applies temporary optimizations for games
  programs.gamemode.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sotha = {
    isNormalUser = true;
    description = "sotha";
    extraGroups = [ "networkmanager" "wheel" "video" "adbusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      # User sys utils
      home-manager
      xdg-utils
      xdg-user-dirs
      dbus
      trash-cli
      #xclip
      wl-clipboard
      brightnessctl
      ripgrep
      entr
      libnotify
      git
      pkg-config
      polkit-kde-agent
      psmisc
      gnumake
      xdg-desktop-portal-hyprland
      hyperfine

      # Lang utils
      ghc
      cabal-install
      idris2
      rustup
      gcc
      clang
      shellcheck
      zsh
      zsh-history
      zsh-completions
      zsh-autocomplete
      zsh-syntax-highlighting
      nodejs_18
      yarn
      tectonic
      flutter
      jdk17
      python3
      luajit
      luajitPackages.luarocks
      tree-sitter
      ocaml
      shopify-cli

      # Node packages

      # Language servers
      haskellPackages.haskell-language-server
      sumneko-lua-language-server
      #nodePackages.typescript-language-server
      ltex-ls
      texlab

      # Android dev
      android-tools
      android-file-transfer

      # Applications - CLI and TUI
      emacs29-nox
      calcurse
      ani-cli
      iamb
      gomuks
      swww
      gitui
      zellij
      yazi
      ueberzugpp
      shotgun
      hacksaw
      joshuto
      bottom
      ps_mem
      fzf
      socat
      jq
      blueman
      termusic
      yt-dlp
      ffmpeg
      librewolf
      neofetch
      pfetch
      xwinwrap
      p7zip
      grim
      cmatrix
      pipewire
      wireplumber

      # Applications - GUI
      woeusb
      libreoffice-qt-fresh
      xmobar
      eww
      syncthing
      vscode
      freetube
      android-studio
      zathura
      brave
      element-desktop
      #qutebrowser
      chromium
      #keepassxc
      nautilus
      libsForQt5.qt5ct
      lxappearance
      libsForQt5.kcharselect
      terminator
      pavucontrol
      tdesktop
      dunst
      alacritty
      wezterm
      picom
      feh
      mpv
      imagemagick
      rofi-wayland

      # Games
      #haskellPackages.swarm
      lutris
      mangohud
      protonup-ng
      shattered-pixel-dungeon
      openmw
      unnethack

      # Themes
      papirus-icon-theme
      adwaita-icon-theme

      #Temporary
      bun
      nix-init
      fend
      wiki-tui
      slurp
      lxqt.lxqt-themes
      lxqt.lxqt-panel
      lxqt.lxqt-config
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    unzip
    dash
    gparted
    exfatprogs
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  services.syncthing = {
    enable = true;
    user = "sotha";
    dataDir = "/home/sotha";    # Default folder for new synced folders
    configDir = "/home/sotha/.config/syncthing";   # Folder for Syncthing's settings and keys
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
