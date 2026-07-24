{ pkgs, ... }:
{
  home.packages = with pkgs; [ xdg-user-dirs ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    download = "$HOME/box/in";
    documents = "$HOME/ref/docs";
    music = "$HOME/ref/lib/music";
    pictures = "$HOME/ref/img/pics";
    videos = "$HOME/ref/img/vid";
    desktop = "$HOME/.arc/desktop";
    templates = "$HOME/ref/templates";
    publicShare = "$HOME/.arc/public";
    projects = "$HOME/src/projects";
  };

  home.sessionVariables = {
  XDG_DATA_HOME = "$HOME/.local/share";
  XDG_CONFIG_HOME = "$HOME/.config";
  XDG_STATE_HOME = "$HOME/.local/state";
  XDG_CACHE_HOME = "$HOME/.cache";

  XDG_DOWNLOAD_DIR = "$HOME/box/in";
  XDG_DOCUMENTS_DIR = "$HOME/ref/docs";
  XDG_MUSIC_DIR = "$HOME/ref/lib/music";
  XDG_PICTURES_DIR = "$HOME/ref/img/pics";
  XDG_VIDEOS_DIR = "$HOME/ref/img/vid";
  XDG_DESKTOP_DIR = "$HOME/.arc/desktop";
  XDG_TEMPLATES_DIR = "$HOME/ref/templates";
  XDG_PUBLICSHARE_DIR = "$HOME/.arc/public";
  XDG_PROJECTS_DIR = "$HOME/src/projects";

  WALLPAPER_DIR = "$HOME/ref/img/wall";
  SCREENSHOT_DIR = "$HOME/ref/img/shot";
  MY_HOME_SYNC = "$HOME/sync";

  GIT_CONFIG_GLOBAL = "$HOME/.config/git/config";
  ZDOTDIR = "$HOME/.config/zsh";
  GNUPGHOME = "$HOME/.local/share/gnupg";
  CARGO_HOME = "$HOME/.local/share/cargo";
  RUSTUP_HOME = "$HOME/.local/share/rustup";
  GOPATH = "$HOME/.local/share/go";
  GOBIN = "$HOME/.local/share/go/bin";
  GOMODCACHE = "$HOME/.cache/go/mod";
  NPM_CONFIG_USERCONFIG = "$HOME/.config/npm/npmrc";
  NPM_CONFIG_CACHE = "$HOME/.cache/npm";
  FFMPEG_DATADIR = "$HOME/.config/ffmpeg";
  RUFF_CACHE_DIR = "$HOME/.cache/ruff";
  OPENAUDIBLE_HOME = "$HOME/.config/openaudible";
  GHCUP_INSTALL_BASE_PREFIX = "$HOME/.local/share";
  GHCUP_USE_XDG_DIRS = "1";
  ANDROID_HOME = "$HOME/.local/share/android";
  ANDROID_USER_HOME = "$HOME/.config/android";
  PYTHON_HISTORY = "$HOME/.local/state/python/history";
  SOAR_CONFIG = "$HOME/.config/soar/config.toml";
  SOAR_BIN = "$HOME/.local/share/soar/bin";
  SOAR_DB = "$HOME/.local/share/soar/db";
  SOAR_CACHE = "$HOME/.cache/soar/cache";
  SOAR_PACKAGES = "$HOME/.local/share/soar/packages";
  SOAR_REPOSITORIES = "$HOME/.local/share/soar/repos";
  CABAL_CONFIG = "$HOME/.config/cabal";
  STACK_XDG = "$HOME/.config/stack";
  TERMINAL = "kitty";
  EDITOR = "nvim";
  VISUAL = "nvim";
  CLICOLOR = "1";
  MANPAGER = "batman";
  };
}
