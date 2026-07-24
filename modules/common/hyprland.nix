{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # keeping on for now per your call — revisit once you know if you need it
  };

  # Required for screen sharing, file pickers, etc. to work under Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk # fallback portal for apps without native Hyprland portal support — not a theme choice, just plumbing
    ];
  };

  # Polkit authentication agent — required for privilege prompts (mounting drives, etc.) under Wayland
  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [
    hyprpolkitagent

    # file manager
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.kio-extras
    kdePackages.ark

    # cursor + icon packages — availability only, no active theme is set here;
    # selection happens in your hyprland.conf (env = XCURSOR_THEME,... etc.)
    bibata-cursors
    papirus-icon-theme
  ];

  # dconf needed by various GTK apps (file chooser state, etc.) — not a theme engine
  programs.dconf.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    dejavu_fonts
    liberation_ttf
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.meslo-lg
    nerd-fonts.hack
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];
}
