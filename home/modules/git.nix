{ ... }:
{
  programs.git = {
    enable = true;
    userName = "x0d167";
    userEmail = "x0d1.67@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      # pinned to the specific resident credential recovered on this host —
      # update if a different physical key becomes primary here
      core.sshCommand = "ssh -i ~/.ssh/id_ed25519_sk_rk_key2";
    };
  };
}
