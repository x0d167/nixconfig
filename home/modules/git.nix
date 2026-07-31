{ pkgs,... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "x0d167";
        email = "144571646+x0d167@users.noreply.github.com";
        signingkey = "1A6A98C5E6F6ACE952F77995FD3DA856728F87D6"; # key2 Sign subkey
      };
      commit.gpgsign = true;

      alias = {
        gs = "status";
        ga = "add";
        gaa = "add --all";
        gd = "diff | diffnav";
        co = "checkout";
        br = "branch";
        cm = "commit -m";
        ps = "push";
        pl = "pull";
        lg = "log --graph --oneline --decorate";
      };

      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      color.ui = true;

      core = {
        editor = "nvim";
        whitespace = "trailing-space,space-before-tab";
        sshCommand = "ssh -i ~/.ssh/id_ed25519_sk_rk_key2";
      };

      url."git@github.com:".insteadOf = [ "gh:" "https://github.com/" ];
    };
    ignores = [ "*.swp" "*~" ".DS_Store" "result" ".direnv" ];
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = false;
    options = {
      line-numbers = true;
      side-by-side = true;
      diff-so-fancy = true;
      navigate = true;
    };
  };


  home.packages = with pkgs; [ diffnav serie ];
}
