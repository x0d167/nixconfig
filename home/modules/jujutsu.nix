{ pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    package = pkgs.jujutsu;
    settings = {
      user = {
        name = "x0d167";
        email = "144571646+x0d167@users.noreply.github.com";
      };

      ui = {
        editor = "nvim";
        default-command = [ "log" ];
      };

      signing = {
        behavior = "own";
        backend = "gpg";
        key = "1A6A98C5E6F6ACE952F77995FD3DA856728F87D6";
      };
    };
  };
}
