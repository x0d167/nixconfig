{ ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    profileExtra = ''
      if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && [ -z "$SSH_CONNECTION" ]; then
          exec start-hyprland
      fi

      # Auto-launch fish for interactive SSH sessions only (not local tty/console)
      if [ -n "$SSH_CONNECTION" ] && [ -z "$FISH_STARTED" ] && [[ $- == *i* ]]; then
          export FISH_STARTED=1
	  exec fish
      fi
    '';

    shellAliases = {
      ll = "ls -la";
      "cd." = "cd ..";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      gs = "git status";
      ga = "git add";
      nv = "nvim";
      sv = "sudo nvim";
    };

    initExtra = ''
      export HISTSIZE=10000
      export HISTCONTROL=ignoreboth
      if command -v trash &>/dev/null; then
        alias rm='trash -v'
      else
        alias rm='rm -i'
      fi
    '';
  };
}
