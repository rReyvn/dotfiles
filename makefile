rice:
	stow --verbose --target=$$HOME/.config/ --restow term
	stow --verbose --target=$$HOME/.config/ --restow wm

rice-term:
	stow --verbose --target=$$HOME/.config/ --restow term

unrice-term:
	stow --verbose --target=$$HOME/.config/ --delete term
	
unrice:
	stow --verbose --target=$$HOME/.config/ --delete term
	stow --verbose --target=$$HOME/.config/ --delete wm
