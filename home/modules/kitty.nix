{ ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 14.0;
    };

    settings = {
      bold_font = "auto";
      bold_italic_font = "auto";
      italic_font = "auto";

      background_opacity = "0.67";
      dynamic_background_opacity = "yes";
      hide_window_decorations = "yes";
      initial_window_height = "700";
      initial_window_width = "950";
      remember_window_size = "yes";

      window_border_width = "0.5pt";
      window_margin_width = "15";

      shell = "/run/current-system/sw/bin/fish";
      shell_integration = "enabled";

      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_bar_align = "left";
      tab_bar_min_tabs = "2";
      tab_bar_margin_width = "0.0";
      tab_bar_margin_height = "2.5 1.5";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
      tab_activity_symbol = "\" ● \"";

      tab_title_template = "\"{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title[:30]}{title[30:] and '…'} [{index}]\"";
      active_tab_title_template = "\"{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title[:30]}{title[30:] and '…'} [{index}]\"";

      cursor_blink_interval = "0.8";
      cursor_shape = "block";
      cursor_stop_blinking_after = "0";
      cursor_trail = "1";
      cursor_trail_decay = "0.2 0.5";
      cursor_trail_start_threshold = "2";

      scrollback_lines = "5000";
      scrollback_pager = "less +G -R";

      mouse_hide_wait = "5.0";
      open_url_modifiers = "ctrl+shift";
      open_url_with = "default";
      select_by_word_characters = ":@-./_~?&=%+#";

      wheel_scroll_min_lines = "1";
      wheel_scroll_multiplier = "5.0";

      term = "xterm-kitty";

      enable_audio_bell = "no";
      notify_on_cmd_finish = "invisible 15";

      allow_remote_control = "yes";
      confirm_os_window_close = "0";
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+s" = "paste_from_selection";
      "shift+insert" = "paste_from_selection";

      "ctrl+shift+up" = "increase_font_size";
      "ctrl+shift+down" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";

      "alt+k" = "scroll_line_up";
      "alt+j" = "scroll_line_down";
      "alt+page_up" = "scroll_page_up";
      "alt+page_down" = "scroll_page_down";
      "alt+home" = "scroll_home";
      "alt+end" = "scroll_end";
      "alt+h" = "show_scrollback";

      "super+alt+n" = "new_os_window";
      "ctrl+shift+w" = "close_window";
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+]" = "next_window";
      "ctrl+shift+[" = "previous_window";
      "ctrl+shift+f" = "move_window_forward";
      "ctrl+shift+b" = "move_window_backward";
      "ctrl+shift+`" = "move_window_to_top";

      "ctrl+shift+1" = "first_window";
      "ctrl+shift+2" = "second_window";
      "ctrl+shift+3" = "third_window";
      "ctrl+shift+4" = "fourth_window";
      "ctrl+shift+5" = "fifth_window";
      "ctrl+shift+6" = "sixth_window";
      "ctrl+shift+7" = "seventh_window";
      "ctrl+shift+8" = "eighth_window";
      "ctrl+shift+9" = "ninth_window";
      "ctrl+shift+0" = "tenth_window";

      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
      "ctrl+shift+l" = "next_layout";
      "ctrl+shift+." = "move_tab_forward";
      "ctrl+shift+," = "move_tab_backward";
    };

    # deliberately deferred — noctalia will write the real theme file here later;
    # this just tells kitty where to look once it exists
    # extraConfig = ''
    #   include themes/noctalia.conf
    # '';
  };
}
