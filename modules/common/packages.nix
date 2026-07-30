{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # ── General CLI ──
    bitwarden-cli
    btop
    duf
    entr
    eza
    fd
    file
    fzf
    git
    gping
    gum
    hexyl
    htop
    imagemagick
    jq
    killall
    lsof
    man-pages
    ncdu
    ripgrep
    ripgrep-all
    socat
    sops
    stow
    tldr
    tree
    unzip
    wget
    xdg-utils
    zellij

    # ── Editor / LSP / formatting support ──
    gcc
    marksman
    neovim
    nixd
    nixfmt
    shellcheck
    shfmt
    stylua
    tinymist
    tree-sitter
    treefmt
    vim

    # ── bat ecosystem ──
    bat
    bat-extras.batdiff
    bat-extras.batgrep
    bat-extras.batman
    bat-extras.batpipe
    bat-extras.batwatch
    bat-extras.prettybat

    # ── Media / graphics ──
    ffmpeg
    gimp
    imv
    mpv
    satty
    vlc

    # ── Desktop / session utilities ──
    cava
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    libreoffice
    lowfi
    mimeo
    obsidian
    pamixer
    pavucontrol
    qt6.qtwayland
    qt6Packages.qt6ct
    udiskie

    # ── System / hardware ──
    # power-profiles-daemon
    # tlp
    # tlp-pd
    coreutils
    curl
    libnotify
    openssl

    # ── Debuggers ──
    gdb
    lldb

    # ── Fun / misc ──
    unimatrix
    glow

    # ── Fish function dependency ──
    trash-cli

    # ── Nix tooling ──
    nix-output-monitor
    nix-tree
    nvd
  ];
}
