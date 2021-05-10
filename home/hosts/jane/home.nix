{ config, pkgs, ... }:
{
    home.stateVersion = "21.05";
    programs.home-manager.enable = true;
    home.username = "cgunn";
    home.homeDirectory = "/home/cgunn";

    imports = [
        ./modules/pkgs
        ./modules/neofetch
        ./modules/kitty
        ./modules/shell
        ./modules/xserver
        ./modules/userdirs
    ];

    home.packages = with pkgs; [
        nitrogen
        brightnessctl
        openvpn
        
        firefox
        chromium
        libreoffice
        spotify
        vscode
        discord
        slack
        mgba
        gimp
        qbittorrent
        calibre
        steam
        
        unar
        zathura
        ripgrep
        du-dust
        htop
        maim
        mupdf
        ( python3.withPackages ( ps: with ps; [ ipython black pip ] ))
        poetry
        gnumake
        docker
        gcc
    ];
}