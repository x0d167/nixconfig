{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # ── General CLI ──
    fd
    file
    git
    jq
    fzf
    killall
    lsof
    man-pages
    ripgrep
    ripgrep-all
    tree
    unzip
    wget
    xdg-utils
    socat
    entr
    duf
    ncdu
    htop
    btop
    gping
    hexyl
    tldr
    gum
    stow
    eza
    imagemagick
    nh

    # ── Editor / LSP / formatting support ──
    neovim
    vim
    nixd
    nixfmt
    marksman
    tinymist
    tree-sitter
    stylua
    shellcheck
    shfmt
    treefmt
    gcc

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
    mpv
    vlc
    imv
    gimp
    satty

    # ── Desktop / session utilities ──
    udiskie
    pavucontrol
    pamixer
    cava
    libreoffice
    mimeo
    qt6.qtwayland
    qt6Packages.qt6ct
    lowfi
    obsidian
    kdePackages.dolphin
    kdePackages.dolphin-plugins

    # ── System / hardware ──
    # tlp
    # tlp-pd
    # power-profiles-daemon
    libnotify
    openssl
    coreutils
    curl

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
