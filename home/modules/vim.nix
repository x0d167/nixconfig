{ ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      " --- Visuals & Layout ---
      syntax off           " Disable syntax highlighting completely
      set number           " Show the absolute line number of the current line
      set relativenumber   " Show relative line numbers for all other lines
      set colorcolumn=80   " Draw a classic vertical guide at column 80

      " --- Indentation Settings ---
      set autoindent       " Copy indent from current line when starting a new line
      set smartindent       " Automatically inserts one extra level of indent after '{'
      set tabstop=2         " Number of spaces that a <Tab> in the file counts for
      set shiftwidth=2      " Number of spaces to use for each step of (auto)indent
      set expandtab         " Use spaces instead of actual tab characters

      " --- The Makefile Safety Net ---
      " Filetype detection must be turned on for this to work
      filetype plugin indent on
      " When opening a Makefile, force Vim to use real tabs instead of spaces
      autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4

      " --- Structural Auto-Pairing ---
      " Curly braces (handles multi-line block alignment on Enter)
      inoremap { {}<Left>
      inoremap {<CR> {<CR>}<Esc>O
      " Parentheses and Square Brackets
      inoremap ( ()<Left>
      inoremap [ []<Left>
    '';
  };
}
