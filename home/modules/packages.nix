{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # LSP servers
    bash-language-server
    clang-tools # clangd
    haskell-language-server
    vscode-langservers-extracted # jsonls
    lua-language-server
    nixd
    ruff
    rust-analyzer
    stylua # also doubles as formatter
    texlab
    tinymist
    zls

    # Formatters (non-duplicate with above)
    shfmt
    shellcheck
    taplo
    rustfmt

    devenv
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
