all:
	stow --verbose --target=$$HOME/.config/ --restow config

delete:
	stow --verbose --target=$$HOME/.config/ --delete config
