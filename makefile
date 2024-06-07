rice:
	stow --verbose --target=$$HOME/.config/ --restow term
	stow --verbose --target=$$HOME/.config/ --restow wm

unrice:
	stow --verbose --target=$$HOME/.config/ --delete term
	stow --verbose --target=$$HOME/.config/ --delete wm
	
rice-term:
	stow --verbose --target=$$HOME/.config/ --restow term

unrice-term:
	stow --verbose --target=$$HOME/.config/ --delete term
	
rice-wm:
	stow --verbose --target=$$HOME/.config/ --restow wm
	stow --verbose --target=$$HOME/.local/bin/ --restow scripts
	
unrice-wm:
	stow --verbose --target=$$HOME/.config/ --delete wm
	stow --verbose --target=$$HOME/.local/bin/ --delete scripts

sprinkle-scripts:
	stow --verbose --target=$$HOME/.local/bin/ --restow scripts
