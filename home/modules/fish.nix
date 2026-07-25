{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      "cd.." = "cd ..";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      gs = "git status";
      ga = "git add";

      grep = "grep --color=auto";
      yz = "yazi";

      nv = "nvim";
      v = "nvim";
      sv = "sudo nvim";
      edit = "nvim";
      lt = "listtypes";
    };

    functions = {
      nixconfig = ''
        cd ~/.config/nixconfig
      '';

      fish_greeting = ''
        set_color bryellow
        echo (date "+%A • %H:%M")
        set_color normal
      '';

      cat = ''
        bat --plain --paging=never $argv
      '';

      ls = ''
        eza -F --color=always --icons=always $argv
      '';

      rm = ''
        trash -v $argv
      '';

      cd = ''
        if test (count $argv) -gt 0
            builtin cd $argv
        else
            builtin cd ~
        end
        zoxide add .
        ls
      '';

      extract = ''
        for archive in $argv
            if test -f $archive
                switch $archive
                    case "*.tar.bz2"  ; tar xvjf $archive
                    case "*.tar.gz"   ; tar xvzf $archive
                    case "*.bz2"      ; bunzip2 $archive
                    case "*.rar"      ; unrar x $archive
                    case "*.gz"       ; gunzip $archive
                    case "*.tar"      ; tar xvf $archive
                    case "*.tbz2"     ; tar xvjf $archive
                    case "*.tgz"      ; tar xvzf $archive
                    case "*.zip"      ; unzip $archive
                    case "*.Z"        ; uncompress $archive
                    case "*.7z"       ; 7z x $archive
                    case "*"
                        echo "Don't know how to extract '$archive'"
                end
            else
                echo "'$archive' is not a valid file!"
            end
        end
      '';

      fj = ''
        set dir (find . -type d 2>/dev/null | fzf)
        if test -n "$dir"
            cd $dir
        end
      '';

      fzff = ''
        set file (find . -type f 2>/dev/null | fzf)
        if test -n "$file"
            nvim $file
        end
      '';

      gcom = ''
        if test (count $argv) -eq 0
            echo "Usage: gcom \"message\" OR gcom file1 file2 \"message\""
            return 1
        end
        if test (count $argv) -eq 1
            git add .
            git commit -m "$argv[1]"
        else
            set msg $argv[-1]
            set files $argv[1..-2]
            git add $files
            git commit -m "$msg"
        end
      '';

      gundo = ''
        git reset --soft HEAD~1
        echo "Commit undone (soft)."
      '';

      listtypes = ''
        set -l target $argv[1]
        if test -z "$target"
            set target "."
        end
        if not test -d $target
            echo "Error: '$target' is not a valid directory."
            return 1
        end
        echo "Scanning extensions in '$target'..."
        find $target -type f | awk -F. 'NF>1 {print tolower($NF)}' | sort | uniq -c | sort -nr
      '';

      touchy = ''
        set file $argv[1]
        mkdir -p (dirname $file)
        touch $file
      '';

      ver = ''
        if test -r /etc/os-release
            cat /etc/os-release
        end
        uname -a
      '';

      wget = ''
        command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" $argv
      '';

      __done_started = {
      	body = ''
	  set -g __done_initial_window_id (hyprctl -j activewindow 2>/dev/null | jq -r '.address // empty' 2>/dev/null)
	  '';
	  onEvent = "fish_preexec";
      };

      __done_ended = {
	  body = ''
	    set -l exit_status $status
	    set -l dur $CMD_DURATION
	    test -z "$dur"; and return
	    test "$dur" -le 5000; and return

	    set -l current_window (hyprctl -j activewindow 2>/dev/null | jq -r '.address // empty' 2>/dev/null)
	    test "$__done_initial_window_id" = "$current_window"; and return
	    string match -qr -- '^git (?!push|pull|fetch)' "$argv[1]"; and return

	    set -l total_s (math --scale=0 "$dur/1000")
	    set -l s (math "$total_s % 60")
	    set -l m (math "$total_s / 60 % 60")
	    set -l h (math "$total_s / 3600")
	    set -l human ""
	    if test $h -gt 0
		set human (printf "%dh %dm %ds" $h $m $s)
	    else if test $m -gt 0
		set human (printf "%dm %ds" $m $s)
	    else
		set human (printf "%ds" $s)
	    end

	    set -l title "Done in $human"
	    test "$exit_status" -ne 0; and set title "Failed ($exit_status) after $human"
	    set -l wd (string replace --regex "^$HOME" "~" "$PWD")

	    set -l urgency normal
	    test "$exit_status" -ne 0; and set urgency critical
	    notify-send --hint=int:transient:1 --urgency="$urgency" \
		--icon=utilities-terminal --app-name=fish --expire-time=3000 \
		"$title" "$wd/ $argv[1]"
	  '';
	  onEvent = "fish_postexec";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs.starship = {
	  enable = true;
	  enableFishIntegration = true;
	  presets = [ "nerd-font-symbols" ];
	  configPath = "${config.home.homeDirectory}/.config/starship/starship.toml";
	  # settings = {};
  };
}
