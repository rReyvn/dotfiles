if status is-interactive
	set -U fish_greeting ""
  set -gx TERM xterm-256color
  set -gx EDITOR nvim
  
  fish_add_path ~/.local/bin
  fish_add_path ~/.cargo/bin/

  zoxide init fish | source
  fzf --fish | source
end
