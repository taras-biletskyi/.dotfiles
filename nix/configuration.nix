# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "autism-machine"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  boot.kernelParams = [
    "i915.force_probe=7d55"
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Disable X11 since you're using Wayland
  services.xserver.enable = false;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.taras = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Taras Biletskyi";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [
    # #  thunderbird
    # ];
  };

  users.defaultUserShell = pkgs.zsh;

  # Install firefox.
  programs.firefox.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    bash-language-server
    bottom
    clang
    cloudflared
    cmake
    delta
    docker-ls
    fastfetch
    firefox
    fzf
    gcc
    gh
    git
    gnumake42
    go_1_22
    google-chrome
    ### Let the ricing begin ###
    hyprland
    # ly   # maybe some time later once I add a lockscreen app too
    kitty
    waybar
    wofi
    # TODO:
    # wofi-emoji
    ### Let the ricing end ###
    hyprls
    jdt-language-server
    k9s
    kmonad
    # translates /dev/input/event* into actual devices
    evtest
    lazydocker
    lazygit
    lua-language-server
    neovim
    (nerdfonts.override {
            fonts = [
                "DejaVuSansMono"
            ];
        }
    )
    ninja
    nixd
    nix-zsh-completions
    nnn
    pyright
    ripgrep
    slack
    taplo
    taplo-lsp
    terraform-ls
    tree
    tmux
    typescript-language-server
    unzip
    usbutils
    vial
    vim
    vscode-langservers-extracted
    wget
    wl-clipboard
    yaml-language-server
    zsh
    zsh-completions
    zsh-fzf-tab
    wev
    # for image viewing
    nsxiv
    jetbrains.datagrip
    jetbrains.idea-community-bin
    gruvbox-gtk-theme
    # TODO:
    # gruvbox-plus-icons
  ];

  services.kmonad = {
   enable = true;
     keyboards = {
       myKMonadOutput = {
         device = "/dev/input/event0";
         config = builtins.readFile /home/taras/.dotfiles/kmonad/config.kbd;
       };
     };
  };

  # Enable fingerprint scanner
  # `fprintd-enroll` to capture prints
  services.fprintd.enable = true;
  # Enable finger auth
  security.pam.services.sudo.fprintAuth = true;

  environment.variables = {
    "GSETTINGS_SCHEMA_DIR" = "/run/current-system/sw/share/gsettings-schemas/${pkgs.mutter}/glib-2.0/schemas";
    "GDK_SCALE" = "1"; # Global scaling (affects GTK apps)
    "GDK_DPI_SCALE" = "1.5"; # Fractional scaling
    # "WAYLAND_DISPLAY" = "wayland-0"; # Wayland environment variable
  };

  # TODO: For Home Manager
  # dconf.settings = {
  #   "org/gnome/mutter" = {
  #     "experimental-features" = ["scale-monitor-framebuffer"];
  #   };
  # };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true programs.gnupg.agent = {
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
  system.stateVersion = "24.11"; # Did you read the comment?

}
