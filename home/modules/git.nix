{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
        user = {
	    name = "x0d167";
	    email = "x0d1.67@proton.me";
	    signingkey = "1A6A98C5E6F6ACE952F77995FD3DA856728F87D6";
	};
	commit.gpgsign = true;
	init.defaultBranch = "main";
	pull.rebase = true;
        
	# pinned to the specific resident credential recovered on this host —
        # update if a different physical key becomes primary here
        core.sshCommand = "ssh -i ~/.ssh/id_ed25519_sk_rk_key2";
    };
  };
}
