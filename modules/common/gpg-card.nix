{ pkgs, ... }:
{
  services.pcscd.enable = false;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  environment.systemPackages = with pkgs; [ gnupg pinentry-curses ccid pcsc-tools ];

  # gpg-agent needs a controlling tty to invoke pinentry;
  # this sets it automatically for every interactive shell
  environment.interactiveShellInit = ''
    export GPG_TTY=$(tty)
  '';
}
