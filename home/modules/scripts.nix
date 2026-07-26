{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "lehgit" ''
      	  timestamp=$(date '+%Y-%m-%d %H:%M')
      	  messages=(
      	      "ugh, I'm probably just tweaking some annoying thing I missed before pushing the last time."
      	      "why is this always the last thing I see after pushing 😭"
      	      "tiny fix that shouldn't exist, but here we are."
      	      "did I push too early? yes. am I fixing it now? also yes."
      	      "fixing that one thing I swore was fine 10 minutes ago."
      	      "the commit of shame. [$timestamp]"
      	      "past me was too confident. again."
      	      "you didn't see this commit, okay?"
      	      "nothing to see here... just a tiny mistake with big dreams."
      	      "guess what? I forgot something. [$timestamp]"
      	      "in my defense, it worked on my machine. eventually."
      	      "correcting a typo that definitely wasn't load-bearing... probably."
      	      "squashing a bug I introduced approximately 4 minutes ago."
      	      "this commit message is longer than the actual fix."
      	      "reader, I did not test this before the last push."
      	  )
      	  random_index=$((RANDOM % ''${#messages[@]}))
      	  random_msg="''${messages[$random_index]} [$timestamp]"
      	  if [[ $# -eq 0 ]]; then
      	      git add . && git commit -m "$random_msg"
      	  elif [[ $# -eq 1 ]]; then
      	      git add . && git commit -m "$1"
      	  else
      	      msg="''${*: -1}"
      	      files=("''${@:1:$#-1}")
      	      git add "''${files[@]}"
      	      git commit -m "$msg"
      	  fi
      	  branch=$(git rev-parse --abbrev-ref HEAD)
      	  git push -u origin "$branch"
    '')

    (pkgs.writeShellScriptBin "pilfer" ''
      pilfer_type="$1"
      shift
      if [[ -z "$pilfer_type" || $# -eq 0 ]]; then
          echo "Usage: pilfer <type> <url> [more...]"
          echo "Supported types: wallpaper, git, font, video, doc"
          exit 1
      fi
      case "$pilfer_type" in
          wallpaper)
              dest="$HOME/ref/img/wall"
              mkdir -p "$dest"
              for url in "$@"; do
                  filename=$(basename "$url")
                  fullpath="$dest/$filename"
                  echo ":: Downloading wallpaper from $url"
                  if curl -L --fail -o "$fullpath" "$url"; then
                      echo ":: Saved as $filename"
                      read -rp "Rename? (new name without extension, Enter to skip): " newname
                      if [[ -n "$newname" ]]; then
                          ext="''${filename##*.}"
                          mv "$fullpath" "$dest/$newname.$ext"
                          echo ":: Renamed to $newname.$ext"
                      fi
                  else
                      echo "Failed: $url"
                  fi
              done
              ;;
          git)
              dest="$HOME/tmp/git"
              mkdir -p "$dest"
              for repo in "$@"; do
                  echo ":: Cloning repo $repo"
                  git clone "$repo" "$dest/$(basename "''${repo%.git}")" || echo "Failed: $repo"
              done
              ;;
          font)
              dest="$HOME/.local/share/fonts"
              mkdir -p "$dest"
              for url in "$@"; do
                  echo ":: Downloading font from $url"
                  curl -L --fail -o "$dest/$(basename "$url")" "$url" || echo "Failed: $url"
              done
              ;;
          video)
              dest="$HOME/ref/img/vid/pilfered"
              mkdir -p "$dest"
              for url in "$@"; do
                  echo ":: Downloading video from $url"
                  yt-dlp -P "$dest" "$url" || echo "Failed: $url"
              done
              ;;
          doc)
              dest="$HOME/ref/docs/lib"
              mkdir -p "$dest"
              for url in "$@"; do
                  echo ":: Downloading document from $url"
                  curl -L --fail -o "$dest/$(basename "$url")" "$url" || echo "Failed: $url"
              done
              ;;
          *)
              echo "Unknown pilfer type: $pilfer_type"
              exit 2
              ;;
      esac
    '')

    (pkgs.writeShellScriptBin "webapp-install" ''
      ICON_DIR="$HOME/.local/share/applications/icons"
      APP_DIR="$HOME/.local/share/applications"
      mkdir -p "$ICON_DIR" "$APP_DIR"
      if [ "$#" -lt 3 ]; then
        echo -e "\e[32mLet's create a new web app you can start with the app launcher.\n\e[0m"
        APP_NAME=$(gum input --prompt "Name> " --placeholder "My favorite web app")
        APP_URL=$(gum input --prompt "URL> " --placeholder "https://example.com")
        ICON_REF=$(gum input --prompt "Icon URL> " --placeholder "URL or local path (PNG)")
        CUSTOM_EXEC=""
        MIME_TYPES=""
        INTERACTIVE_MODE=true
      else
        APP_NAME="$1"
        APP_URL="$2"
        ICON_REF="$3"
        CUSTOM_EXEC="$4"
        MIME_TYPES="$5"
        INTERACTIVE_MODE=false
      fi
      if [[ -z "$APP_NAME" || -z "$APP_URL" || -z "$ICON_REF" ]]; then
        echo "You must set app name, app URL, and icon URL!"
        exit 1
      fi
      SAFE_APP_NAME=$(echo "$APP_NAME" | tr ' /' '_-')
      ICON_PATH="$ICON_DIR/$SAFE_APP_NAME.png"
      if [[ $ICON_REF =~ ^https?:// ]]; then
        if ! curl -sfL -o "$ICON_PATH" "$ICON_REF"; then
          echo "Error: Failed to download icon."
          exit 1
        fi
      else
        if [[ -f "$ICON_REF" ]]; then
          cp "$ICON_REF" "$ICON_PATH"
        elif [[ -f "$ICON_DIR/$ICON_REF" ]]; then
          cp "$ICON_DIR/$ICON_REF" "$ICON_PATH"
        else
          echo "Error: Local icon file not found at $ICON_REF"
          exit 1
        fi
      fi
      if [[ -n $CUSTOM_EXEC ]]; then
        EXEC_COMMAND="$CUSTOM_EXEC"
      else
        LAUNCHER_BIN=$(command -v webapp-launch)
        if [[ -z "$LAUNCHER_BIN" ]]; then
            echo "Error: webapp-launch not found in your PATH."
            exit 1
        fi
        EXEC_COMMAND="$LAUNCHER_BIN $APP_URL"
      fi
      DESKTOP_FILE="$APP_DIR/$SAFE_APP_NAME.desktop"
      cat >"$DESKTOP_FILE" <<EOF
      [Desktop Entry]
      Version=1.0
      Name=$APP_NAME
      Comment=$APP_NAME
      Exec=$EXEC_COMMAND
      Terminal=false
      Type=Application
      Icon=$ICON_PATH
      StartupNotify=true
      EOF
      if [[ -n $MIME_TYPES ]]; then
        echo "MimeType=$MIME_TYPES" >>"$DESKTOP_FILE"
      fi
      chmod +x "$DESKTOP_FILE"
      if [[ $INTERACTIVE_MODE == true ]]; then
        echo -e "You can now find $APP_NAME using the app launcher.\n"
      fi
    '')

    (pkgs.writeShellScriptBin "webapp-launch" ''
      CANDIDATES=(
        "chromium.desktop"
        "ungoogled-chromium.desktop"
      )
      BROWSER_EXEC=""
      for candidate in "''${CANDIDATES[@]}"; do
        for path in "$HOME/.local/share/applications" "$HOME/.nix-profile/share/applications" "/run/current-system/sw/share/applications" "/usr/share/applications"; do
          if [[ -f "$path/$candidate" ]]; then
            BROWSER_EXEC=$(grep '^Exec=' "$path/$candidate" | head -1 | cut -d'=' -f2- | sed 's/ %[a-zA-Z]//g' | tr -d '"')
            break 2
          fi
        done
      done
      if [[ -z "$BROWSER_EXEC" ]]; then
        notify-send "Web App Error" "No Chromium-based browser found."
        exit 1
      fi
      exec $BROWSER_EXEC --app="$1" "''${@:2}"
    '')

    (pkgs.writeShellScriptBin "webapp-remove" ''
      ICON_DIR="$HOME/.local/share/applications/icons"
      DESKTOP_DIR="$HOME/.local/share/applications/"
      if [ "$#" -eq 0 ]; then
        declare -A APP_MAP
        while IFS= read -r -d ''' file; do
          if grep -q '^Exec=.*\(webapp-launch\|webapp-handler\).*' "$file"; then
            safe_name=$(basename "''${file%.desktop}")
            display_name=$(sed -n 's/^Name=//p' "$file")
            APP_MAP["$display_name"]="$safe_name"
          fi
        done < <(find "$DESKTOP_DIR" -name '*.desktop' -print0)
        if ((''${#APP_MAP[@]})); then
          SELECTION=$(printf '%s\n' "''${!APP_MAP[@]}" | sort | gum choose --no-limit --header "Select web app to remove..." --selected-prefix="✗ ")
          APP_NAMES=()
          while IFS= read -r display; do
            [[ -n "$display" ]] && APP_NAMES+=("''${APP_MAP[$display]}")
          done <<< "$SELECTION"
        else
          echo "No web apps to remove."
          exit 1
        fi
      else
        APP_NAMES=("$@")
      fi
      if [[ ''${#APP_NAMES[@]} -eq 0 ]]; then
        echo "You must select at least one web app to remove."
        exit 1
      fi
      for APP_NAME in "''${APP_NAMES[@]}"; do
        if [[ -f "$DESKTOP_DIR/$APP_NAME.desktop" ]]; then
          rm -f "$DESKTOP_DIR/$APP_NAME.desktop"
          echo "Removed Desktop entry: $APP_NAME"
        fi
        if [[ -f "$ICON_DIR/$APP_NAME.png" ]]; then
          rm -f "$ICON_DIR/$APP_NAME.png"
          echo "Removed Icon: $APP_NAME"
        fi
      done
    '')

    (pkgs.writeShellScriptBin "nixgen" ''
      nixos-rebuild list-generations
    '')

    (pkgs.writeShellScriptBin "nixswitch" ''
      set -euo pipefail
      if [ -z "''${1:-}" ]; then
        echo "usage: nixgen <generation-number>" >&2
        exit 1
      fi
      sudo /nix/var/nix/profiles/system-$1-link/bin/switch-to-configuration switch
    '')

    (pkgs.writeShellScriptBin "nixback" ''
      sudo nixos-rebuild switch --rollback
    '')
    (pkgs.writeShellScriptBin "devenv-new" ''
      set -euo pipefail
      TEMPLATE_DIR="$HOME/.config/devenv-templates"
      if [ "$#" -ne 1 ]; then
          echo "usage: devenv-new <language>"
          echo "available templates:"
          ls "$TEMPLATE_DIR"
          exit 1
      fi
      LANG="$1"
      SRC="$TEMPLATE_DIR/$LANG"
      if [ ! -d "$SRC" ]; then
          echo "no template for '$LANG'. available:"
          ls "$TEMPLATE_DIR"
          exit 1
      fi
      cp -r "$SRC"/. .
      direnv allow .
      echo "devenv template '$LANG' applied. run 'devenv shell' or just cd back in."
    '')
  ];
}
