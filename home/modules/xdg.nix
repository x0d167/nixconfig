{ config, pkgs, ... }:
let
  home = config.home.homeDirectory;
in
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
    XDG_DATA_HOME = "${home}/.local/share";
    XDG_CONFIG_HOME = "${home}/.config";
    XDG_STATE_HOME = "${home}/.local/state";
    XDG_CACHE_HOME = "${home}/.cache";
    XDG_DOWNLOAD_DIR = "${home}/box/in";
    XDG_DOCUMENTS_DIR = "${home}/ref/docs";
    XDG_MUSIC_DIR = "${home}/ref/lib/music";
    XDG_PICTURES_DIR = "${home}/ref/img/pics";
    XDG_VIDEOS_DIR = "${home}/ref/img/vid";
    XDG_DESKTOP_DIR = "${home}/.arc/desktop";
    XDG_TEMPLATES_DIR = "${home}/ref/templates";
    XDG_PUBLICSHARE_DIR = "${home}/.arc/public";
    XDG_PROJECTS_DIR = "${home}/src/projects";
    WALLPAPER_DIR = "${home}/ref/img/wall";
    SCREENSHOT_DIR = "${home}/ref/img/shot";
    MY_HOME_SYNC = "${home}/sync";
    GIT_CONFIG_GLOBAL = "${home}/.config/git/config";
    ZDOTDIR = "${home}/.config/zsh";
    GNUPGHOME = "${home}/.local/share/gnupg";
    CARGO_HOME = "${home}/.local/share/cargo";
    RUSTUP_HOME = "${home}/.local/share/rustup";
    GOPATH = "${home}/.local/share/go";
    GOBIN = "${home}/.local/share/go/bin";
    GOMODCACHE = "${home}/.cache/go/mod";
    NPM_CONFIG_USERCONFIG = "${home}/.config/npm/npmrc";
    NPM_CONFIG_CACHE = "${home}/.cache/npm";
    FFMPEG_DATADIR = "${home}/.config/ffmpeg";
    RUFF_CACHE_DIR = "${home}/.cache/ruff";
    OPENAUDIBLE_HOME = "${home}/.config/openaudible";
    GHCUP_INSTALL_BASE_PREFIX = "${home}/.local/share";
    GHCUP_USE_XDG_DIRS = "1";
    ANDROID_HOME = "${home}/.local/share/android";
    ANDROID_USER_HOME = "${home}/.config/android";
    PYTHON_HISTORY = "${home}/.local/state/python/history";
    SOAR_CONFIG = "${home}/.config/soar/config.toml";
    SOAR_BIN = "${home}/.local/share/soar/bin";
    SOAR_DB = "${home}/.local/share/soar/db";
    SOAR_CACHE = "${home}/.cache/soar/cache";
    SOAR_PACKAGES = "${home}/.local/share/soar/packages";
    SOAR_REPOSITORIES = "${home}/.local/share/soar/repos";
    CABAL_CONFIG = "${home}/.config/cabal";
    STACK_XDG = "${home}/.config/stack";
    TERMINAL = "kitty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    CLICOLOR = "1";
    LS_COLOR = "...";
    MANPAGER = "batman";
  };
}
