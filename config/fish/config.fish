if status is-interactive
	set -U fish_greeting ""
  set -gx TERM xterm-256color
  set -gx EDITOR nvim

  zoxide init fish | source
  fzf --fish | source
end
