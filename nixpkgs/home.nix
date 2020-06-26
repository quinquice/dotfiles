{ pkgs, ... }:

{
  home.packages = with pkgs; [
    haskellPackages.xmonad
    haskellPackages.xmonad-extras
    haskellPackages.xmonad-contrib_0_16
    haskellPackages.xmobar
    picom
    nitrogen
    brightnessctl

    python38
    python38Packages.ipython
    python38Packages.virtualenv
    python38Packages.virtualenvwrapper
    maven
    jdk

    firefox
    chromium
    libreoffice
    spotify
    vscode
    calibre
    libreoffice
    steam
    zoom-us
    bluejeans-gui
    discord
    slack
    gimp
    sage
    blender
    scid-vs-pc
    stockfish
    leela-zero

    kitty
    unzip
    dmenu
    xclip
    ffmpeg
    multimc
    zathura
    neofetch
    openconnect
    xdg-user-dirs
    ripgrep
    du-dust
    htop
    tree
    maim
    feh
    lsof

    fira-code
    hack-font
    dejavu_fonts
    source-code-pro

    oh-my-zsh
    spaceship-prompt
    autojump
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "ls -lah";
      nixr = "sudo nixos-rebuild switch";
      blu = "bluetoothctl";
      cleo = "clear && neofetch";
      few = "feh --image-bg white";
    };
    initExtra = ''
      source ${pkgs.spaceship-prompt}/share/zsh/themes/spaceship.zsh-theme

      SPACESHIP_DIR_TRUNC=5;
      SPACESHIP_CHAR_SYMBOL="$";
      SPACESHIP_CHAR_SUFFIX=" ";
      SPACESHIP_GIT_STATUS_DELETED="X";
      neofetch
    '';
  };
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git" "autojump" "virtualenvwrapper"
      "colorize" "colored-man-pages"
    ];
  };

  programs.git = {
    enable = true;
    userName = "Charles Gunn";
    userEmail = "cjgunnmail@gmail.com";
  };

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = "/home/cgunn/.config/nixpkgs/xmonad/xmonad.hs";
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include /home/cgunn/.config/nixpkgs/kitty/kitty.conf
    '';
  };

  services.picom = {
    enable = true;
    inactiveDim = "0.25";
    opacityRule = [ 
      "90:class_g = 'kitty'"
    ];
  };

  xdg.userDirs = {
    enable      = true;
    desktop     = "\"\$HOME/.desktop\"";
    documents   = "\"\$HOME/docs\"";
    download    = "\"\$HOME/downloads\"";
    music       = "\"\$HOME/audio/music\"";
    pictures    = "\"\$HOME/images/pictures\"";
    videos      = "\"\$HOME/video\"";
    publicShare = "\"\$HOME/.useless\"";
    templates   = "\"\$HOME/.useless\"";
  };
}